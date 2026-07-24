param(
    [string]$TemplatePath = (Join-Path $PSScriptRoot '..\2025-template_bullet.docx'),
    [string]$OutputDirectory = (Join-Path $PSScriptRoot '..\curriculums')
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Escape-Xml {
    param([AllowEmptyString()][string]$Text)
    return [System.Security.SecurityElement]::Escape($Text)
}

function New-Run {
    param(
        [AllowEmptyString()][string]$Text,
        [int]$Size = 18,
        [switch]$Bold,
        [switch]$Italic,
        [string]$Color = '000000',
        [string]$Font = 'Arial'
    )

    $properties = @(
        "<w:rFonts w:ascii=`"$Font`" w:hAnsi=`"$Font`" w:cs=`"$Font`"/>"
        "<w:color w:val=`"$Color`"/>"
        "<w:sz w:val=`"$Size`"/>"
        "<w:szCs w:val=`"$Size`"/>"
    )
    if ($Bold) { $properties += '<w:b/><w:bCs/>' }
    if ($Italic) { $properties += '<w:i/><w:iCs/>' }

    $space = if ($Text.StartsWith(' ') -or $Text.EndsWith(' ')) { ' xml:space="preserve"' } else { '' }
    return "<w:r><w:rPr>$($properties -join '')</w:rPr><w:t$space>$(Escape-Xml $Text)</w:t></w:r>"
}

function New-Paragraph {
    param(
        [string[]]$Runs,
        [ValidateSet('left', 'center', 'right')][string]$Alignment = 'left',
        [int]$Before = 0,
        [int]$After = 0,
        [int]$Line = 220,
        [int]$Left = 0,
        [int]$Hanging = 0,
        [switch]$KeepNext,
        [switch]$BottomBorder
    )

    $keep = if ($KeepNext) { '<w:keepNext/>' } else { '' }
    $indent = if ($Left -gt 0 -or $Hanging -gt 0) {
        "<w:ind w:left=`"$Left`" w:hanging=`"$Hanging`"/>"
    } else { '' }
    $border = if ($BottomBorder) {
        '<w:pBdr><w:bottom w:val="single" w:sz="6" w:space="3" w:color="000000"/></w:pBdr>'
    } else { '' }

    return @"
<w:p>
  <w:pPr>
    $keep
    <w:jc w:val="$Alignment"/>
    <w:spacing w:before="$Before" w:after="$After" w:line="$Line" w:lineRule="auto"/>
    $indent
    $border
  </w:pPr>
  $($Runs -join '')
</w:p>
"@
}

function New-SectionHeading {
    param([string]$Text)
    return New-Paragraph -Runs @(New-Run -Text $Text.ToUpperInvariant() -Size 19 -Bold) `
        -Before 115 -After 40 -Line 210 -KeepNext -BottomBorder
}

function New-EntryHeading {
    param(
        [string]$Title,
        [string]$Organization,
        [string]$Dates
    )

    $leftText = if ($Organization) { "$Title | $Organization" } else { $Title }
    return @"
<w:p>
  <w:pPr>
    <w:keepNext/>
    <w:tabs><w:tab w:val="right" w:pos="10800"/></w:tabs>
    <w:spacing w:before="38" w:after="8" w:line="210" w:lineRule="auto"/>
  </w:pPr>
  $(New-Run -Text $leftText -Size 18 -Bold)
  <w:r><w:tab/></w:r>
  $(New-Run -Text $Dates -Size 17 -Italic -Color '333333')
</w:p>
"@
}

function New-Bullet {
    param([string]$Text)
    $runs = @(
        (New-Run -Text '•' -Size 18),
        (New-Run -Text " $Text" -Size 18)
    )
    return New-Paragraph -Runs $runs -After 16 -Line 214 -Left 290 -Hanging 220
}

function New-SkillLine {
    param(
        [string]$Label,
        [string]$Text
    )
    return New-Paragraph -Runs @(
        (New-Run -Text "${Label}: " -Size 18 -Bold),
        (New-Run -Text $Text -Size 18)
    ) -After 12 -Line 210
}

function Get-TemplateSectionProperties {
    param([string]$Path)
    $archive = [System.IO.Compression.ZipFile]::OpenRead((Resolve-Path $Path).Path)
    try {
        $entry = $archive.GetEntry('word/document.xml')
        $reader = [System.IO.StreamReader]::new($entry.Open())
        try { $xmlText = $reader.ReadToEnd() } finally { $reader.Dispose() }
    } finally {
        $archive.Dispose()
    }

    [xml]$document = $xmlText
    $namespaces = [System.Xml.XmlNamespaceManager]::new($document.NameTable)
    $namespaces.AddNamespace('w', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
    return $document.SelectSingleNode('//w:sectPr', $namespaces).OuterXml
}

function Set-ZipEntryText {
    param(
        [string]$ArchivePath,
        [string]$EntryPath,
        [string]$Text
    )

    $archive = [System.IO.Compression.ZipFile]::Open($ArchivePath, [System.IO.Compression.ZipArchiveMode]::Update)
    try {
        $existing = $archive.GetEntry($EntryPath)
        if ($null -ne $existing) { $existing.Delete() }
        $entry = $archive.CreateEntry($EntryPath, [System.IO.Compression.CompressionLevel]::Optimal)
        $stream = $entry.Open()
        $writer = [System.IO.StreamWriter]::new($stream, [System.Text.UTF8Encoding]::new($false))
        try { $writer.Write($Text) } finally { $writer.Dispose(); $stream.Dispose() }
    } finally {
        $archive.Dispose()
    }
}

function New-ResumeDocumentXml {
    param(
        [hashtable]$Resume,
        [string]$SectionProperties
    )

    $body = [System.Collections.Generic.List[string]]::new()
    $body.Add((New-Paragraph -Runs @(New-Run -Text 'ENZO DAVID PREDIGER HAMNN' -Size 39 -Bold) -Alignment center -After 20 -Line 240))
    $body.Add((New-Paragraph -Runs @(New-Run -Text $Resume.Target -Size 22 -Bold -Color '1F4E79') -Alignment center -After 22 -Line 220))
    $body.Add((New-Paragraph -Runs @(
        (New-Run -Text 'Concepción del Uruguay, Entre Ríos, Argentina  •  ' -Size 16),
        (New-Run -Text 'enzodprediger@gmail.com  •  ' -Size 16 -Color '1F4E79'),
        (New-Run -Text 'linkedin.com/in/enzo-prediger  •  github.com/enzodp9' -Size 16 -Color '1F4E79')
    ) -Alignment center -After 30 -Line 200 -BottomBorder))

    $body.Add((New-SectionHeading -Text 'Perfil'))
    $body.Add((New-Paragraph -Runs @(New-Run -Text $Resume.Profile -Size 18) -After 18 -Line 218))

    $body.Add((New-SectionHeading -Text 'Competencias técnicas'))
    foreach ($skill in $Resume.Skills) {
        $body.Add((New-SkillLine -Label $skill.Label -Text $skill.Text))
    }

    $body.Add((New-SectionHeading -Text 'Experiencia profesional'))
    foreach ($experience in $Resume.Experience) {
        $body.Add((New-EntryHeading -Title $experience.Title -Organization $experience.Organization -Dates $experience.Dates))
        foreach ($bullet in $experience.Bullets) {
            $body.Add((New-Bullet -Text $bullet))
        }
    }

    $body.Add((New-SectionHeading -Text 'Proyectos seleccionados'))
    foreach ($project in $Resume.Projects) {
        $body.Add((New-EntryHeading -Title $project.Title -Organization $project.Stack -Dates $project.Year))
        $body.Add((New-Bullet -Text $project.Description))
    }

    $body.Add((New-SectionHeading -Text 'Formación y certificaciones'))
    $body.Add((New-EntryHeading -Title 'Ingeniería en Sistemas de Información' -Organization 'Universidad Tecnológica Nacional' -Dates '2018–2025'))
    $body.Add((New-Paragraph -Runs @(New-Run -Text 'Facultad Regional Concepción del Uruguay · Analista Universitario en Sistemas de Información (título intermedio, 2023)' -Size 17 -Italic -Color '333333') -After 18 -Line 205))
    foreach ($certification in $Resume.Certifications) {
        $body.Add((New-Bullet -Text $certification))
    }

    $body.Add((New-SectionHeading -Text 'Idiomas'))
    $body.Add((New-Paragraph -Runs @(New-Run -Text 'Español nativo  •  Inglés B1–B2  •  Alemán A1' -Size 18) -After 0 -Line 210))

    return @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
            xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
            xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
            xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
            mc:Ignorable="w14">
  <w:body>
    $($body -join "`n")
    $SectionProperties
  </w:body>
</w:document>
"@
}

$resumes = @(
    @{
        FileName = 'Enzo_Prediger_CV_Power_Platform.docx'
        Target = 'POWER PLATFORM DEVELOPER'
        Profile = 'Ingeniero en Sistemas de Información especializado en digitalización de procesos industriales con Microsoft Power Platform. Experiencia diseñando soluciones en producción con Power Pages, Power Apps, Power Automate, Dataverse, Power BI y AI Builder, combinando low-code con JavaScript, Liquid y servicios de Azure.'
        Skills = @(
            @{ Label = 'Power Platform'; Text = 'Power Apps, Power Automate, Power Pages, Dataverse, Power BI, AI Builder' }
            @{ Label = 'Desarrollo e integración'; Text = 'JavaScript, TypeScript, Liquid Templates, REST, C#/.NET, Python' }
            @{ Label = 'Cloud y entrega'; Text = 'Azure App Service, Azure Functions, Azure SQL, GitHub Actions, CI/CD' }
        )
        Experience = @(
            @{
                Title = 'Software & AI Engineer'
                Organization = 'Cantera La Chola II / UD-TI para la Industria'
                Dates = 'sep. 2024–actualidad'
                Bullets = @(
                    'Diseñé e implementé aplicaciones, automatizaciones e integraciones sobre Power Platform para procesos de logística, producción, laboratorio y análisis de datos.'
                    'Desarrollé dos portales operativos en producción con Power Pages y Dataverse, cubriendo pedidos, despacho, flota, stock, mantenimiento, recursos humanos y liquidaciones.'
                    'Configuré seguridad granular con 95 reglas de permisos por tabla y rol, formularios multipaso y 47 páginas reutilizables con Liquid, JavaScript y Bootstrap.'
                    'Automaticé procesos regulatorios y documentales con Power Automate e integré AI Builder para extraer datos de remitos desde imágenes y PDF.'
                )
            }
            @{
                Title = 'Fundador | Software Engineer'
                Organization = 'MIGA Software'
                Dates = '2025–actualidad'
                Bullets = @(
                    'Diseñé y llevé a producción un SaaS para ventas, producción, recetas, inventario y caja de panaderías y pastelerías.'
                    'Lideré arquitectura full stack, despliegue en Azure y automatización de entregas mediante GitHub Actions; producto en producción desde mayo de 2026.'
                )
            }
            @{
                Title = 'Desarrollador Full Stack'
                Organization = 'AReNe'
                Dates = 'mar.–dic. 2022'
                Bullets = @(
                    'Implementé funcionalidades para gestión de pacientes, turnos e historiales clínicos con NestJS, GraphQL, MySQL y React.'
                )
            }
        )
        Projects = @(
            @{
                Title = 'Portal de Gestión Logística y Despacho'
                Stack = 'Power Pages · Dataverse · Power Automate'
                Year = '2026'
                Description = 'Digitalicé el ciclo completo de pedidos, asignación de flota, despacho, descarga y facturación para usuarios internos, clientes y transportistas.'
            }
            @{
                Title = 'Portal de Gestión de Producción'
                Stack = 'Power Pages · Dataverse · JavaScript'
                Year = '2026'
                Description = 'Implementé un modelo operativo y un motor de liquidación de regalías con reglas de negocio, seguridad por rol y automatizaciones regulatorias.'
            }
            @{
                Title = 'Asistente RAG para Power Platform'
                Stack = 'Python · SQLite Vector · Ollama'
                Year = '2026'
                Description = 'Construí una solución RAG local que indexa documentación de Microsoft Learn y genera respuestas con citas verificables.'
            }
        )
        Certifications = @(
            'PL-400: Microsoft Power Platform Developer · Udemy'
            'PL-900: Microsoft Power Platform Fundamentals · Udemy'
            'Associate AI Engineer for Developers · DataCamp'
        )
    },
    @{
        FileName = 'Enzo_Prediger_CV_AI_Engineer.docx'
        Target = 'AI ENGINEER'
        Profile = 'Ingeniero en Sistemas de Información con experiencia construyendo soluciones de IA aplicada para entornos industriales. Desarrollo asistentes con LLMs, RAG, MCP y tool calling; pipelines de embeddings y búsqueda vectorial; APIs en Python y despliegues en Azure, con foco en salidas estructuradas, trazabilidad y operación en producción.'
        Skills = @(
            @{ Label = 'IA generativa'; Text = 'LLMs, RAG, MCP, Tool Calling, LangGraph, Prompt Engineering, salidas estructuradas' }
            @{ Label = 'Machine Learning'; Text = 'Embeddings, Vector Search, ResNet50, scikit-learn, PyOD, TensorFlow/Keras' }
            @{ Label = 'Ingeniería'; Text = 'Python, FastAPI, SQL, PostgreSQL/pgvector, SQLite, Docker, Azure, GitHub Actions' }
        )
        Experience = @(
            @{
                Title = 'Software & AI Engineer'
                Organization = 'Cantera La Chola II / UD-TI para la Industria'
                Dates = 'sep. 2024–actualidad'
                Bullets = @(
                    'Diseñé soluciones de IA e integración para optimizar logística, laboratorio, producción y análisis de datos en un entorno industrial.'
                    'Construí y desplegué un asistente conversacional en producción que expone lógica logística mediante MCP y usa Claude, LangGraph y tool calling para consultar viajes y gestionar operaciones.'
                    'Integré detección de anomalías con reglas de negocio e Isolation Forest, manteniendo la decisión analítica fuera del LLM y desacoplada del canal conversacional.'
                    'Implementé extracción documental con AI Builder y Power Automate para convertir remitos en datos estructurados y trazables.'
                )
            }
            @{
                Title = 'Fundador | Software Engineer'
                Organization = 'MIGA Software'
                Dates = '2025–actualidad'
                Bullets = @(
                    'Diseñé, desarrollé y opero un SaaS full stack sobre Azure, en producción desde mayo de 2026.'
                    'Implementé arquitectura cloud y CI/CD con GitHub Actions para sostener la evolución continua del producto.'
                )
            }
            @{
                Title = 'Becario de Investigación'
                Organization = 'Grupo de Gestión de Operaciones y Logística, UTN'
                Dates = 'mar.–nov. 2023'
                Bullets = @(
                    'Procesé y analicé datos con Python para construir y validar una simulación de una línea de producción industrial en SIMIO.'
                )
            }
        )
        Projects = @(
            @{
                Title = 'Asistente RAG para Power Platform'
                Stack = 'Python · Ollama · sqlite-vec · Next.js'
                Year = '2026'
                Description = 'Desarrollé un pipeline incremental de ingesta, chunking, embeddings y búsqueda semántica que responde con citas verificables de Microsoft Learn.'
            }
            @{
                Title = 'Intent Assistant MCP'
                Stack = 'FastAPI · LangGraph · Claude · MCP'
                Year = '2026'
                Description = 'Implementé una arquitectura desacoplada de herramientas reutilizables, consumible desde una aplicación web o cualquier cliente compatible con MCP.'
            }
            @{
                Title = 'Fashion Visual Search'
                Stack = 'ResNet50 · pgvector · FastAPI · Azure'
                Year = '2026'
                Description = 'Construí un buscador visual con embeddings de 2048 dimensiones, búsqueda vectorial exacta e ingesta desacoplada, desplegado en Azure Container Apps.'
            }
            @{
                Title = 'Generador de DFD con IA'
                Stack = 'Claude/OpenAI · Zod · React Flow'
                Year = '2026'
                Description = 'Diseñé generación agnóstica de proveedor con prompting estructurado, validación de esquemas y corrección de conexiones para obtener diagramas formalmente válidos.'
            }
        )
        Certifications = @(
            'Associate AI Engineer for Developers · DataCamp'
            'PL-400: Microsoft Power Platform Developer · Udemy'
        )
    },
    @{
        FileName = 'Enzo_Prediger_CV_Data_Engineer.docx'
        Target = 'DATA ENGINEER'
        Profile = 'Ingeniero en Sistemas de Información orientado a ingeniería de datos, con experiencia modelando información operativa, construyendo pipelines en Python y SQL e integrando datos industriales en Dataverse, PostgreSQL, SQLite y Azure SQL. Combino ingesta, transformación, calidad y analítica para llevar datos a decisiones y productos en producción.'
        Skills = @(
            @{ Label = 'Datos'; Text = 'Python, SQL, Pandas, ETL, modelado relacional, calidad de datos, procesamiento incremental' }
            @{ Label = 'Plataformas'; Text = 'PostgreSQL, pgvector, SQL Server, Azure SQL, SQLite, Dataverse, Supabase' }
            @{ Label = 'Analítica y cloud'; Text = 'Statsmodels, Pyomo, scikit-learn, Power BI, Azure, Docker, GitHub Actions, CI/CD' }
        )
        Experience = @(
            @{
                Title = 'Software & AI Engineer'
                Organization = 'Cantera La Chola II / UD-TI para la Industria'
                Dates = 'sep. 2024–actualidad'
                Bullets = @(
                    'Diseñé arquitecturas de datos e integración en Python, Azure y Microsoft Power Platform para procesos de logística, producción, laboratorio y análisis operativo.'
                    'Modelé en Dataverse dominios de pedidos, viajes, flota, tarifas, stock, mantenimiento, empleados y liquidaciones, con relaciones y reglas de acceso por rol.'
                    'Automaticé ingesta y transformación de información documental mediante AI Builder y Power Automate, reduciendo carga manual y mejorando trazabilidad.'
                    'Construí servicios de consulta y análisis sobre datos logísticos, incluyendo detección de anomalías con reglas de negocio e Isolation Forest.'
                )
            }
            @{
                Title = 'Becario de Investigación'
                Organization = 'Grupo de Gestión de Operaciones y Logística, UTN'
                Dates = 'mar.–nov. 2023'
                Bullets = @(
                    'Realicé relevamiento, limpieza, procesamiento y análisis de datos en Python para construir y validar un modelo de simulación industrial en SIMIO.'
                    'Colaboré con Pecarí Implementos en el estudio de una línea de producción y la evaluación de escenarios de optimización.'
                )
            }
            @{
                Title = 'Fundador | Software Engineer'
                Organization = 'MIGA Software'
                Dates = '2025–actualidad'
                Bullets = @(
                    'Diseñé el modelo de información de un SaaS que integra ventas, producción, recetas, inventario, compras, caja y reportes.'
                    'Desplegué y opero el producto sobre Azure con CI/CD mediante GitHub Actions; en producción desde mayo de 2026.'
                )
            }
        )
        Projects = @(
            @{
                Title = 'Forecasting y optimización de inventario'
                Stack = 'Pandas · SARIMA · Pyomo · Streamlit'
                Year = '2024'
                Description = 'Construí un pipeline que clasifica demanda ABC-XYZ, pronostica con SARIMA y optimiza compras e inventario bajo restricciones y costos del negocio.'
            }
            @{
                Title = 'Fashion Visual Search'
                Stack = 'PostgreSQL · pgvector · FastAPI · Docker'
                Year = '2026'
                Description = 'Implementé preparación de dataset, embeddings, ingesta masiva desacoplada y búsqueda vectorial exacta con una arquitectura portable entre PostgreSQL local y Supabase.'
            }
            @{
                Title = 'Pipeline RAG documental'
                Stack = 'Python · SQLite · sqlite-vec'
                Year = '2026'
                Description = 'Desarrollé ingesta incremental, normalización, fragmentación, generación de embeddings e indexado vectorial de documentación técnica.'
            }
        )
        Certifications = @(
            'Associate AI Engineer for Developers · DataCamp'
            'PL-400: Microsoft Power Platform Developer · Udemy'
        )
    }
)

$resolvedTemplate = (Resolve-Path $TemplatePath).Path
$resolvedOutput = [System.IO.Path]::GetFullPath($OutputDirectory)
if (-not (Test-Path -LiteralPath $resolvedOutput)) {
    New-Item -ItemType Directory -Path $resolvedOutput | Out-Null
}

$sectionProperties = Get-TemplateSectionProperties -Path $resolvedTemplate
foreach ($resume in $resumes) {
    $destination = Join-Path $resolvedOutput $resume.FileName
    Copy-Item -LiteralPath $resolvedTemplate -Destination $destination -Force
    $documentXml = New-ResumeDocumentXml -Resume $resume -SectionProperties $sectionProperties
    Set-ZipEntryText -ArchivePath $destination -EntryPath 'word/document.xml' -Text $documentXml
    Write-Output $destination
}
