<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Brokian Performance | Metas</title>

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

        .kpi-icon {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 52px;
            height: 52px;
            border-radius: 14px;
            font-size: 22px;
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

        .status-cumplida {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #dff7eb;
            color: #15824f;
            font-weight: 600;
        }

        .status-progreso {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #e1efff;
            color: #1769c2;
            font-weight: 600;
        }

        .status-atrasada {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #ffe1e1;
            color: #b72f2f;
            font-weight: 600;
        }

        .progress {
            height: 12px;
            border-radius: 20px;
        }

        .table thead th {
            color: #52677d;
            font-size: 14px;
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

    <a href="metas.jsp"
       class="active">

        <i class="fa-solid fa-bullseye"></i>

        Metas

    </a>

    <a href="reportes.jsp">

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
                Metas
            </h1>

            <p class="text-muted mb-0">
                Seguimiento del cumplimiento de objetivos por asesor
            </p>

        </div>

        <button
            class="btn btn-brokian px-4"
            data-bs-toggle="modal"
            data-bs-target="#modalMeta">

            <i class="fa-solid fa-circle-plus me-2"></i>

            Nueva meta

        </button>

    </div>

    <div class="row g-4 mb-4">

        <div class="col-xl-3 col-md-6">

            <div class="panel">

                <div class="d-flex justify-content-between align-items-center">

                    <div>

                        <span class="text-muted">
                            Metas registradas
                        </span>

                        <h2 class="fw-bold mt-2 mb-0"
                            id="totalMetas">

                            5

                        </h2>

                    </div>

                    <div class="kpi-icon icon-blue">

                        <i class="fa-solid fa-bullseye"></i>

                    </div>

                </div>

            </div>

        </div>

        <div class="col-xl-3 col-md-6">

            <div class="panel">

                <div class="d-flex justify-content-between align-items-center">

                    <div>

                        <span class="text-muted">
                            Metas cumplidas
                        </span>

                        <h2 class="fw-bold mt-2 mb-0 text-success"
                            id="metasCumplidas">

                            2

                        </h2>

                    </div>

                    <div class="kpi-icon icon-green">

                        <i class="fa-solid fa-circle-check"></i>

                    </div>

                </div>

            </div>

        </div>

        <div class="col-xl-3 col-md-6">

            <div class="panel">

                <div class="d-flex justify-content-between align-items-center">

                    <div>

                        <span class="text-muted">
                            En progreso
                        </span>

                        <h2 class="fw-bold mt-2 mb-0 text-primary"
                            id="metasProgreso">

                            2

                        </h2>

                    </div>

                    <div class="kpi-icon icon-purple">

                        <i class="fa-solid fa-spinner"></i>

                    </div>

                </div>

            </div>

        </div>

        <div class="col-xl-3 col-md-6">

            <div class="panel">

                <div class="d-flex justify-content-between align-items-center">

                    <div>

                        <span class="text-muted">
                            Cumplimiento promedio
                        </span>

                        <h2 class="fw-bold mt-2 mb-0 text-warning"
                            id="promedioCumplimiento">

                            78%

                        </h2>

                    </div>

                    <div class="kpi-icon icon-orange">

                        <i class="fa-solid fa-chart-pie"></i>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <div class="panel">

        <div class="d-flex justify-content-between align-items-center mb-4">

            <h4 class="fw-bold mb-0">
                Metas por asesor
            </h4>

            <input
                type="text"
                id="buscadorMeta"
                class="form-control"
                placeholder="Buscar asesor, periodo o estado"
                style="max-width: 320px;"
                onkeyup="filtrarMetas()">

        </div>

        <div class="table-responsive">

            <table class="table align-middle">

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>Asesor</th>
                        <th>Periodo</th>
                        <th>Meta</th>
                        <th>Resultado</th>
                        <th>Cumplimiento</th>
                        <th>Estado</th>

                    </tr>

                </thead>

                <tbody id="tablaMetas">

                    <tr data-porcentaje="100">

                        <td>M001</td>
                        <td>Juan Pérez</td>
                        <td>Agosto 2026</td>
                        <td>10 ventas</td>
                        <td>10 ventas</td>

                        <td style="min-width: 180px;">

                            <div class="d-flex justify-content-between mb-1">

                                <small>100%</small>

                            </div>

                            <div class="progress">

                                <div class="progress-bar bg-success"
                                     style="width: 100%">
                                </div>

                            </div>

                        </td>

                        <td>

                            <span class="status-cumplida">
                                Cumplida
                            </span>

                        </td>

                    </tr>

                    <tr data-porcentaje="80">

                        <td>M002</td>
                        <td>María López</td>
                        <td>Agosto 2026</td>
                        <td>10 ventas</td>
                        <td>8 ventas</td>

                        <td style="min-width: 180px;">

                            <div class="d-flex justify-content-between mb-1">

                                <small>80%</small>

                            </div>

                            <div class="progress">

                                <div class="progress-bar"
                                     style="width: 80%">
                                </div>

                            </div>

                        </td>

                        <td>

                            <span class="status-progreso">
                                En progreso
                            </span>

                        </td>

                    </tr>

                    <tr data-porcentaje="62">

                        <td>M003</td>
                        <td>Carlos Ramírez</td>
                        <td>Agosto 2026</td>
                        <td>8 ventas</td>
                        <td>5 ventas</td>

                        <td style="min-width: 180px;">

                            <div class="d-flex justify-content-between mb-1">

                                <small>62%</small>

                            </div>

                            <div class="progress">

                                <div class="progress-bar bg-warning"
                                     style="width: 62%">
                                </div>

                            </div>

                        </td>

                        <td>

                            <span class="status-progreso">
                                En progreso
                            </span>

                        </td>

                    </tr>

                    <tr data-porcentaje="110">

                        <td>M004</td>
                        <td>Luis García</td>
                        <td>Agosto 2026</td>
                        <td>10 ventas</td>
                        <td>11 ventas</td>

                        <td style="min-width: 180px;">

                            <div class="d-flex justify-content-between mb-1">

                                <small>110%</small>

                            </div>

                            <div class="progress">

                                <div class="progress-bar bg-success"
                                     style="width: 100%">
                                </div>

                            </div>

                        </td>

                        <td>

                            <span class="status-cumplida">
                                Cumplida
                            </span>

                        </td>

                    </tr>

                    <tr data-porcentaje="38">

                        <td>M005</td>
                        <td>Fernanda Ruiz</td>
                        <td>Agosto 2026</td>
                        <td>8 ventas</td>
                        <td>3 ventas</td>

                        <td style="min-width: 180px;">

                            <div class="d-flex justify-content-between mb-1">

                                <small>38%</small>

                            </div>

                            <div class="progress">

                                <div class="progress-bar bg-danger"
                                     style="width: 38%">
                                </div>

                            </div>

                        </td>

                        <td>

                            <span class="status-atrasada">
                                Atrasada
                            </span>

                        </td>

                    </tr>

                </tbody>

            </table>

        </div>

    </div>

</main>

<div class="modal fade"
     id="modalMeta"
     tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Registrar nueva meta
                </h5>

                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body">

                <form id="formMeta">

                    <div class="mb-3">

                        <label class="form-label">
                            Asesor
                        </label>

                        <select
                            id="asesorMeta"
                            class="form-select"
                            required>

                            <option value="">
                                Selecciona un asesor
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

                            <option value="Fernanda Ruiz">
                                Fernanda Ruiz
                            </option>

                        </select>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">
                            Periodo
                        </label>

                        <input
                            type="month"
                            id="periodoMeta"
                            class="form-control"
                            required>

                    </div>

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Meta de ventas
                            </label>

                            <input
                                type="number"
                                id="cantidadMeta"
                                class="form-control"
                                min="1"
                                placeholder="Ejemplo: 10"
                                required>

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Ventas realizadas
                            </label>

                            <input
                                type="number"
                                id="resultadoMeta"
                                class="form-control"
                                min="0"
                                placeholder="Ejemplo: 5"
                                required>

                        </div>

                    </div>

                </form>

            </div>

            <div class="modal-footer">

                <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal">

                    Cancelar

                </button>

                <button
                    type="button"
                    class="btn btn-brokian"
                    onclick="agregarMeta()">

                    Guardar meta

                </button>

            </div>

        </div>

    </div>

</div>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

<script>

    function agregarMeta() {

        const asesor =
                document.getElementById("asesorMeta").value;

        const periodo =
                document.getElementById("periodoMeta").value;

        const cantidad =
                parseInt(
                    document.getElementById("cantidadMeta").value
                );

        const resultado =
                parseInt(
                    document.getElementById("resultadoMeta").value
                );

        if (
            asesor === "" ||
            periodo === "" ||
            isNaN(cantidad) ||
            isNaN(resultado) ||
            cantidad <= 0 ||
            resultado < 0
        ) {

            alert("Completa correctamente todos los campos.");

            return;
        }

        const porcentaje =
                Math.round((resultado / cantidad) * 100);

        let estado = "";
        let claseEstado = "";
        let claseBarra = "";

        if (porcentaje >= 100) {

            estado = "Cumplida";
            claseEstado = "status-cumplida";
            claseBarra = "bg-success";

        } else if (porcentaje >= 50) {

            estado = "En progreso";
            claseEstado = "status-progreso";
            claseBarra = "";

        } else {

            estado = "Atrasada";
            claseEstado = "status-atrasada";
            claseBarra = "bg-danger";

        }

        const tbody =
                document.getElementById("tablaMetas");

        const totalFilas =
                tbody.querySelectorAll("tr").length + 1;

        const id =
                "M" + String(totalFilas).padStart(3, "0");

        const periodoFormateado =
                formatearPeriodo(periodo);

        const anchoBarra =
                porcentaje > 100 ? 100 : porcentaje;

        const fila =
                document.createElement("tr");

        fila.setAttribute(
            "data-porcentaje",
            porcentaje
        );

        fila.innerHTML =
                "<td>" + id + "</td>" +
                "<td>" + asesor + "</td>" +
                "<td>" + periodoFormateado + "</td>" +
                "<td>" + cantidad + " ventas</td>" +
                "<td>" + resultado + " ventas</td>" +
                "<td style='min-width: 180px;'>" +
                    "<div class='d-flex justify-content-between mb-1'>" +
                        "<small>" + porcentaje + "%</small>" +
                    "</div>" +
                    "<div class='progress'>" +
                        "<div class='progress-bar " + claseBarra + "'" +
                        " style='width: " + anchoBarra + "%'>" +
                        "</div>" +
                    "</div>" +
                "</td>" +
                "<td>" +
                    "<span class='" + claseEstado + "'>" +
                        estado +
                    "</span>" +
                "</td>";

        tbody.appendChild(fila);

        document
            .getElementById("formMeta")
            .reset();

        actualizarIndicadores();

        const modalElemento =
                document.getElementById("modalMeta");

        const modal =
                bootstrap.Modal.getInstance(modalElemento);

        modal.hide();
    }

    function filtrarMetas() {

        const texto =
                document
                    .getElementById("buscadorMeta")
                    .value
                    .toLowerCase();

        const filas =
                document.querySelectorAll("#tablaMetas tr");

        filas.forEach(function(fila) {

            const contenido =
                    fila.textContent.toLowerCase();

            fila.style.display =
                    contenido.includes(texto)
                    ? ""
                    : "none";

        });
    }

    function actualizarIndicadores() {

        const filas =
                document.querySelectorAll("#tablaMetas tr");

        let cumplidas = 0;
        let progreso = 0;
        let sumaPorcentajes = 0;

        filas.forEach(function(fila) {

            const porcentaje =
                    parseFloat(
                        fila.getAttribute("data-porcentaje")
                    );

            sumaPorcentajes += porcentaje;

            const contenido =
                    fila.textContent.toLowerCase();

            if (contenido.includes("cumplida")) {
                cumplidas++;
            }

            if (contenido.includes("en progreso")) {
                progreso++;
            }

        });

        const total =
                filas.length;

        const promedio =
                total > 0
                ? Math.round(sumaPorcentajes / total)
                : 0;

        document
            .getElementById("totalMetas")
            .textContent = total;

        document
            .getElementById("metasCumplidas")
            .textContent = cumplidas;

        document
            .getElementById("metasProgreso")
            .textContent = progreso;

        document
            .getElementById("promedioCumplimiento")
            .textContent = promedio + "%";
    }

    function formatearPeriodo(periodo) {

        const partes =
                periodo.split("-");

        const anio =
                partes[0];

        const mes =
                parseInt(partes[1]);

        const meses = [
            "Enero",
            "Febrero",
            "Marzo",
            "Abril",
            "Mayo",
            "Junio",
            "Julio",
            "Agosto",
            "Septiembre",
            "Octubre",
            "Noviembre",
            "Diciembre"
        ];

        return meses[mes - 1] + " " + anio;
    }

</script>

</body>

</html>