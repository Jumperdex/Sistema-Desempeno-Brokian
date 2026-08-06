<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Brokian Performance | Reportes</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        body {
            margin: 0;
            background: #f4f7fb;
            font-family: "Segoe UI", sans-serif;
            color: #102a4c;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100vh;
            padding: 25px 18px;
            background: #082544;
            color: white;
        }

        .logo {
            display: block;
            width: 175px;
            margin: 0 auto 35px;
            padding: 8px;
            background: white;
            border-radius: 8px;
        }

        .menu-title {
            margin: 20px 12px 10px;
            color: #93a9be;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            gap: 13px;
            margin-bottom: 8px;
            padding: 13px 15px;
            border-radius: 9px;
            color: #dce7f1;
            text-decoration: none;
            transition: 0.2s;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background: #17c9a8;
            color: white;
        }

        .sidebar i {
            width: 20px;
            text-align: center;
        }

        .main {
            margin-left: 250px;
            padding: 30px;
        }

        .panel {
            padding: 25px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(15, 42, 76, 0.08);
        }

        .btn-brokian {
            background: #17c9a8;
            color: white;
            border: none;
        }

        .btn-brokian:hover {
            background: #11aa8e;
            color: white;
        }

        .report-card {
            height: 100%;
            padding: 25px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(15, 42, 76, 0.08);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .report-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 28px rgba(15, 42, 76, 0.13);
        }

        .report-icon {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 58px;
            height: 58px;
            margin-bottom: 18px;
            border-radius: 15px;
            font-size: 25px;
        }

        .icon-green {
            color: #15824f;
            background: #dff7eb;
        }

        .icon-blue {
            color: #1769c2;
            background: #e1efff;
        }

        .icon-orange {
            color: #b36c00;
            background: #fff2d9;
        }

        .icon-purple {
            color: #7144bd;
            background: #eee5ff;
        }

        .icon-red {
            color: #b72f2f;
            background: #ffe1e1;
        }

        .icon-teal {
            color: #0f8c78;
            background: #dcf8f2;
        }

        .status-generado {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #dff7eb;
            color: #15824f;
            font-weight: 600;
        }

        .table thead th {
            color: #52677d;
            font-size: 14px;
        }

        @media print {

            .sidebar,
            .no-print,
            .btn,
            .filtros {
                display: none !important;
            }

            .main {
                margin-left: 0;
                padding: 0;
            }

            body {
                background: white;
            }

            .panel,
            .report-card {
                box-shadow: none;
                border: 1px solid #ddd;
            }
        }

        @media (max-width: 900px) {

            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
            }

            .main {
                margin-left: 0;
            }
        }

    </style>

</head>

<body>

<aside class="sidebar">

    <img src="img/brokian.png"
         class="logo"
         alt="Logo Brokian">

    <div class="menu-title">
        MENÚ PRINCIPAL
    </div>

    <a href="dashboard.jsp">

        <i class="fa-solid fa-chart-line"></i>

        Dashboard

    </a>

    <a href="empleados.jsp">

        <i class="fa-solid fa-users"></i>

        Empleados

    </a>

    <a href="asistencia.jsp">

        <i class="fa-solid fa-calendar-check"></i>

        Asistencia

    </a>

    <a href="ventas.jsp">

        <i class="fa-solid fa-dollar-sign"></i>

        Ventas

    </a>

    <a href="metas.jsp">

        <i class="fa-solid fa-bullseye"></i>

        Metas

    </a>

    <a href="reportes.jsp"
       class="active">

        <i class="fa-solid fa-file-lines"></i>

        Reportes

    </a>

    <div class="menu-title">
        SESIÓN
    </div>

    <a href="login.jsp">

        <i class="fa-solid fa-right-from-bracket"></i>

        Cerrar sesión

    </a>

</aside>

<main class="main">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h1 class="fw-bold mb-1">
                Reportes
            </h1>

            <p class="text-muted mb-0">
                Consulta y generación de reportes de desempeño
            </p>

        </div>

        <button
            type="button"
            class="btn btn-brokian px-4 no-print"
            onclick="imprimirReporte()">

            <i class="fa-solid fa-print me-2"></i>

            Imprimir reporte

        </button>

    </div>

    <div class="panel mb-4 filtros">

        <h5 class="fw-bold mb-3">
            Filtros del reporte
        </h5>

        <div class="row g-3">

            <div class="col-md-3">

                <label class="form-label">
                    Tipo de reporte
                </label>

                <select id="tipoReporte"
                        class="form-select">

                    <option value="General">
                        Reporte general
                    </option>

                    <option value="Ventas">
                        Reporte de ventas
                    </option>

                    <option value="Asistencia">
                        Reporte de asistencia
                    </option>

                    <option value="Metas">
                        Reporte de metas
                    </option>

                    <option value="Rendimiento">
                        Reporte de rendimiento
                    </option>

                </select>

            </div>

            <div class="col-md-3">

                <label class="form-label">
                    Asesor
                </label>

                <select id="asesorReporte"
                        class="form-select">

                    <option value="Todos">
                        Todos los asesores
                    </option>

                    <option value="Juan Pérez">
                        Juan Pérez
                    </option>

                    <option value="María López">
                        María López
                    </option>

                    <option value="Carlos Ramírez">
                        Carlos Ramírez
                    </option>

                    <option value="Luis García">
                        Luis García
                    </option>

                </select>

            </div>

            <div class="col-md-2">

                <label class="form-label">
                    Fecha inicial
                </label>

                <input type="date"
                       id="fechaInicio"
                       class="form-control">

            </div>

            <div class="col-md-2">

                <label class="form-label">
                    Fecha final
                </label>

                <input type="date"
                       id="fechaFin"
                       class="form-control">

            </div>

            <div class="col-md-2 d-flex align-items-end">

                <button type="button"
                        class="btn btn-brokian w-100"
                        onclick="generarReporte()">

                    <i class="fa-solid fa-magnifying-glass me-2"></i>

                    Generar

                </button>

            </div>

        </div>

    </div>

    <div class="row g-4 mb-4">

        <div class="col-xl-4 col-md-6">

            <div class="report-card">

                <div class="report-icon icon-green">

                    <i class="fa-solid fa-dollar-sign"></i>

                </div>

                <h4 class="fw-bold">
                    Reporte de ventas
                </h4>

                <p class="text-muted">
                    Consulta ventas realizadas, montos y resultados por asesor.
                </p>

                <button type="button"
                        class="btn btn-outline-success"
                        onclick="seleccionarReporte('Ventas')">

                    Generar reporte

                </button>

            </div>

        </div>

        <div class="col-xl-4 col-md-6">

            <div class="report-card">

                <div class="report-icon icon-orange">

                    <i class="fa-solid fa-calendar-check"></i>

                </div>

                <h4 class="fw-bold">
                    Reporte de asistencia
                </h4>

                <p class="text-muted">
                    Consulta entradas, salidas, retardos y faltas del personal.
                </p>

                <button type="button"
                        class="btn btn-outline-warning"
                        onclick="seleccionarReporte('Asistencia')">

                    Generar reporte

                </button>

            </div>

        </div>

        <div class="col-xl-4 col-md-6">

            <div class="report-card">

                <div class="report-icon icon-blue">

                    <i class="fa-solid fa-bullseye"></i>

                </div>

                <h4 class="fw-bold">
                    Reporte de metas
                </h4>

                <p class="text-muted">
                    Analiza el porcentaje de cumplimiento de cada asesor.
                </p>

                <button type="button"
                        class="btn btn-outline-primary"
                        onclick="seleccionarReporte('Metas')">

                    Generar reporte

                </button>

            </div>

        </div>

        <div class="col-xl-4 col-md-6">

            <div class="report-card">

                <div class="report-icon icon-purple">

                    <i class="fa-solid fa-chart-line"></i>

                </div>

                <h4 class="fw-bold">
                    Reporte de rendimiento
                </h4>

                <p class="text-muted">
                    Compara productividad, llamadas, citas y ventas.
                </p>

                <button type="button"
                        class="btn btn-outline-secondary"
                        onclick="seleccionarReporte('Rendimiento')">

                    Generar reporte

                </button>

            </div>

        </div>

        <div class="col-xl-4 col-md-6">

            <div class="report-card">

                <div class="report-icon icon-red">

                    <i class="fa-solid fa-triangle-exclamation"></i>

                </div>

                <h4 class="fw-bold">
                    Reporte de incidencias
                </h4>

                <p class="text-muted">
                    Identifica faltas, retardos y metas que requieren atención.
                </p>

                <button type="button"
                        class="btn btn-outline-danger"
                        onclick="seleccionarReporte('Asistencia')">

                    Generar reporte

                </button>

            </div>

        </div>

        <div class="col-xl-4 col-md-6">

            <div class="report-card">

                <div class="report-icon icon-teal">

                    <i class="fa-solid fa-file-circle-check"></i>

                </div>

                <h4 class="fw-bold">
                    Reporte ejecutivo
                </h4>

                <p class="text-muted">
                    Resumen general para supervisores y administradores.
                </p>

                <button type="button"
                        class="btn btn-outline-success"
                        onclick="seleccionarReporte('General')">

                    Generar reporte

                </button>

            </div>

        </div>

    </div>

    <div class="panel"
         id="resultadoReporte">

        <div class="d-flex justify-content-between align-items-start mb-4">

            <div>

                <h3 class="fw-bold mb-1"
                    id="tituloReporte">

                    Reporte general de desempeño

                </h3>

                <p class="text-muted mb-0"
                   id="subtituloReporte">

                    Todos los asesores | Agosto 2026

                </p>

            </div>

            <span class="status-generado">

                <i class="fa-solid fa-circle-check me-1"></i>

                Generado

            </span>

        </div>

        <div class="row g-4 mb-4">

            <div class="col-md-3">

                <div class="p-3 border rounded-3">

                    <span class="text-muted">
                        Ventas totales
                    </span>

                    <h3 class="fw-bold text-success mt-2"
                        id="resumenVentas">

                        37

                    </h3>

                </div>

            </div>

            <div class="col-md-3">

                <div class="p-3 border rounded-3">

                    <span class="text-muted">
                        Monto vendido
                    </span>

                    <h3 class="fw-bold text-primary mt-2"
                        id="resumenMonto">

                        $1,250,000

                    </h3>

                </div>

            </div>

            <div class="col-md-3">

                <div class="p-3 border rounded-3">

                    <span class="text-muted">
                        Asistencia
                    </span>

                    <h3 class="fw-bold text-warning mt-2"
                        id="resumenAsistencia">

                        95%

                    </h3>

                </div>

            </div>

            <div class="col-md-3">

                <div class="p-3 border rounded-3">

                    <span class="text-muted">
                        Cumplimiento
                    </span>

                    <h3 class="fw-bold text-info mt-2"
                        id="resumenCumplimiento">

                        85%

                    </h3>

                </div>

            </div>

        </div>

        <div class="table-responsive">

            <table class="table align-middle">

                <thead>

                    <tr>

                        <th>Asesor</th>
                        <th>Llamadas</th>
                        <th>Citas</th>
                        <th>Ventas</th>
                        <th>Meta</th>
                        <th>Cumplimiento</th>
                        <th>Asistencia</th>

                    </tr>

                </thead>

                <tbody id="tablaReporte">

                    <tr>

                        <td>Juan Pérez</td>
                        <td>325</td>
                        <td>28</td>
                        <td>10</td>
                        <td>10</td>
                        <td>100%</td>
                        <td>98%</td>

                    </tr>

                    <tr>

                        <td>María López</td>
                        <td>298</td>
                        <td>24</td>
                        <td>8</td>
                        <td>10</td>
                        <td>80%</td>
                        <td>96%</td>

                    </tr>

                    <tr>

                        <td>Carlos Ramírez</td>
                        <td>240</td>
                        <td>18</td>
                        <td>5</td>
                        <td>8</td>
                        <td>62%</td>
                        <td>91%</td>

                    </tr>

                    <tr>

                        <td>Luis García</td>
                        <td>350</td>
                        <td>30</td>
                        <td>11</td>
                        <td>10</td>
                        <td>110%</td>
                        <td>97%</td>

                    </tr>

                    <tr>

                        <td>Fernanda Ruiz</td>
                        <td>198</td>
                        <td>14</td>
                        <td>3</td>
                        <td>8</td>
                        <td>38%</td>
                        <td>93%</td>

                    </tr>

                </tbody>

            </table>

        </div>

        <div class="mt-4 p-3 bg-light rounded-3">

            <strong>Observación:</strong>

            <span id="observacionReporte">

                El equipo presenta un buen nivel de asistencia. Se recomienda
                dar seguimiento a los asesores con cumplimiento menor al 70%.

            </span>

        </div>

    </div>

</main>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

<script>

    function seleccionarReporte(tipo) {

        document.getElementById("tipoReporte").value = tipo;

        generarReporte();

        document
            .getElementById("resultadoReporte")
            .scrollIntoView({
                behavior: "smooth"
            });
    }

    function generarReporte() {

        const tipo =
                document.getElementById("tipoReporte").value;

        const asesor =
                document.getElementById("asesorReporte").value;

        const fechaInicio =
                document.getElementById("fechaInicio").value;

        const fechaFin =
                document.getElementById("fechaFin").value;

        let titulo = "";
        let observacion = "";

        if (tipo === "General") {

            titulo = "Reporte general de desempeño";

            observacion =
                "El equipo presenta un buen nivel de asistencia. " +
                "Se recomienda dar seguimiento a los asesores con " +
                "cumplimiento menor al 70%.";

        } else if (tipo === "Ventas") {

            titulo = "Reporte de ventas";

            observacion =
                "Las ventas muestran un comportamiento positivo. " +
                "Los asesores con mayor resultado son Luis García y Juan Pérez.";

        } else if (tipo === "Asistencia") {

            titulo = "Reporte de asistencia";

            observacion =
                "La asistencia promedio es favorable. " +
                "Se recomienda revisar los retardos e incidencias registradas.";

        } else if (tipo === "Metas") {

            titulo = "Reporte de cumplimiento de metas";

            observacion =
                "Dos asesores alcanzaron su meta. " +
                "Los demás requieren seguimiento para mejorar su cumplimiento.";

        } else {

            titulo = "Reporte de rendimiento";

            observacion =
                "El rendimiento se calculó considerando llamadas, citas, " +
                "ventas, asistencia y cumplimiento de metas.";

        }

        let periodo = "Periodo general";

        if (fechaInicio !== "" && fechaFin !== "") {

            periodo =
                formatearFecha(fechaInicio) +
                " al " +
                formatearFecha(fechaFin);

        } else if (fechaInicio !== "") {

            periodo =
                "Desde " +
                formatearFecha(fechaInicio);

        } else if (fechaFin !== "") {

            periodo =
                "Hasta " +
                formatearFecha(fechaFin);

        }

        document
            .getElementById("tituloReporte")
            .textContent = titulo;

        document
            .getElementById("subtituloReporte")
            .textContent =
                (asesor === "Todos"
                    ? "Todos los asesores"
                    : asesor) +
                " | " +
                periodo;

        document
            .getElementById("observacionReporte")
            .textContent = observacion;

        filtrarTablaPorAsesor(asesor);

        alert("Reporte generado correctamente.");
    }

    function filtrarTablaPorAsesor(asesor) {

        const filas =
                document.querySelectorAll("#tablaReporte tr");

        filas.forEach(function(fila) {

            if (asesor === "Todos") {

                fila.style.display = "";

            } else {

                const nombre =
                        fila.cells[0]
                            .textContent
                            .trim();

                fila.style.display =
                        nombre === asesor
                        ? ""
                        : "none";
            }
        });
    }

    function imprimirReporte() {

        window.print();
    }

    function formatearFecha(fecha) {

        const partes =
                fecha.split("-");

        return partes[2] +
               "/" +
               partes[1] +
               "/" +
               partes[0];
    }

</script>

</body>

</html>