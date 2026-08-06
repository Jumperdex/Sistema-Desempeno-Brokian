<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Brokian Performance | Ventas</title>

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

        .status-aprobada {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #dff7eb;
            color: #15824f;
            font-weight: 600;
        }

        .status-pendiente {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #fff2d9;
            color: #b36c00;
            font-weight: 600;
        }

        .status-cancelada {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #ffe1e1;
            color: #b72f2f;
            font-weight: 600;
        }

        .table thead th {
            color: #52677d;
            font-size: 14px;
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

        .icon-purple {
            color: #7144bd;
            background: #eee5ff;
        }

        .icon-orange {
            color: #b36c00;
            background: #fff2d9;
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

    <a href="ventas.jsp"
       class="active">

        <i class="fa-solid fa-dollar-sign"></i>

        Ventas

    </a>

    <a href="metas.jsp">

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
                Ventas
            </h1>

            <p class="text-muted mb-0">
                Registro y seguimiento de ventas por asesor
            </p>

        </div>

        <button
            class="btn btn-brokian px-4"
            data-bs-toggle="modal"
            data-bs-target="#modalVenta">

            <i class="fa-solid fa-circle-plus me-2"></i>

            Registrar venta

        </button>

    </div>

    <div class="row g-4 mb-4">

        <div class="col-xl-3 col-md-6">

            <div class="panel">

                <div class="d-flex justify-content-between align-items-center">

                    <div>

                        <span class="text-muted">
                            Ventas registradas
                        </span>

                        <h2 class="fw-bold mt-2 mb-0"
                            id="totalVentas">

                            5

                        </h2>

                    </div>

                    <div class="kpi-icon icon-green">

                        <i class="fa-solid fa-cart-shopping"></i>

                    </div>

                </div>

            </div>

        </div>

        <div class="col-xl-3 col-md-6">

            <div class="panel">

                <div class="d-flex justify-content-between align-items-center">

                    <div>

                        <span class="text-muted">
                            Monto total
                        </span>

                        <h2 class="fw-bold mt-2 mb-0 text-success"
                            id="montoTotal">

                            $1,250,000

                        </h2>

                    </div>

                    <div class="kpi-icon icon-blue">

                        <i class="fa-solid fa-sack-dollar"></i>

                    </div>

                </div>

            </div>

        </div>

        <div class="col-xl-3 col-md-6">

            <div class="panel">

                <div class="d-flex justify-content-between align-items-center">

                    <div>

                        <span class="text-muted">
                            Ventas aprobadas
                        </span>

                        <h2 class="fw-bold mt-2 mb-0 text-primary"
                            id="ventasAprobadas">

                            3

                        </h2>

                    </div>

                    <div class="kpi-icon icon-purple">

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
                            Ticket promedio
                        </span>

                        <h2 class="fw-bold mt-2 mb-0 text-warning"
                            id="ticketPromedio">

                            $250,000

                        </h2>

                    </div>

                    <div class="kpi-icon icon-orange">

                        <i class="fa-solid fa-chart-column"></i>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <div class="panel">

        <div class="d-flex justify-content-between align-items-center mb-4">

            <h4 class="fw-bold mb-0">
                Historial de ventas
            </h4>

            <input
                type="text"
                id="buscadorVenta"
                class="form-control"
                placeholder="Buscar asesor, producto o estado"
                style="max-width: 320px;"
                onkeyup="filtrarVentas()">

        </div>

        <div class="table-responsive">

            <table class="table align-middle">

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>Asesor</th>
                        <th>Cliente</th>
                        <th>Producto</th>
                        <th>Fecha</th>
                        <th>Monto</th>
                        <th>Estado</th>

                    </tr>

                </thead>

                <tbody id="tablaVentas">

                    <tr data-monto="350000">

                        <td>V001</td>
                        <td>Juan Pérez</td>
                        <td>Roberto Martínez</td>
                        <td>Crédito inmobiliario</td>
                        <td>01/08/2026</td>
                        <td>$350,000</td>

                        <td>

                            <span class="status-aprobada">
                                Aprobada
                            </span>

                        </td>

                    </tr>

                    <tr data-monto="275000">

                        <td>V002</td>
                        <td>María López</td>
                        <td>Fernanda Ruiz</td>
                        <td>Financiamiento</td>
                        <td>02/08/2026</td>
                        <td>$275,000</td>

                        <td>

                            <span class="status-aprobada">
                                Aprobada
                            </span>

                        </td>

                    </tr>

                    <tr data-monto="180000">

                        <td>V003</td>
                        <td>Carlos Ramírez</td>
                        <td>José Hernández</td>
                        <td>Crédito de consumo</td>
                        <td>03/08/2026</td>
                        <td>$180,000</td>

                        <td>

                            <span class="status-pendiente">
                                Pendiente
                            </span>

                        </td>

                    </tr>

                    <tr data-monto="320000">

                        <td>V004</td>
                        <td>Luis García</td>
                        <td>Patricia Gómez</td>
                        <td>Crédito inmobiliario</td>
                        <td>04/08/2026</td>
                        <td>$320,000</td>

                        <td>

                            <span class="status-aprobada">
                                Aprobada
                            </span>

                        </td>

                    </tr>

                    <tr data-monto="125000">

                        <td>V005</td>
                        <td>Juan Pérez</td>
                        <td>Ricardo Soto</td>
                        <td>Financiamiento</td>
                        <td>05/08/2026</td>
                        <td>$125,000</td>

                        <td>

                            <span class="status-cancelada">
                                Cancelada
                            </span>

                        </td>

                    </tr>

                </tbody>

            </table>

        </div>

    </div>

</main>

<div class="modal fade"
     id="modalVenta"
     tabindex="-1">

    <div class="modal-dialog modal-lg">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">

                    Registrar nueva venta

                </h5>

                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body">

                <form id="formVenta">

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Asesor
                            </label>

                            <select
                                id="asesorVenta"
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

                            </select>

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Nombre del cliente
                            </label>

                            <input
                                type="text"
                                id="clienteVenta"
                                class="form-control"
                                required>

                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Producto
                            </label>

                            <select
                                id="productoVenta"
                                class="form-select"
                                required>

                                <option value="">
                                    Selecciona un producto
                                </option>

                                <option value="Crédito inmobiliario">
                                    Crédito inmobiliario
                                </option>

                                <option value="Financiamiento">
                                    Financiamiento
                                </option>

                                <option value="Crédito de consumo">
                                    Crédito de consumo
                                </option>

                                <option value="Plan de inversión">
                                    Plan de inversión
                                </option>

                            </select>

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Fecha
                            </label>

                            <input
                                type="date"
                                id="fechaVenta"
                                class="form-control"
                                required>

                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Monto de la venta
                            </label>

                            <input
                                type="number"
                                id="montoVenta"
                                class="form-control"
                                min="1"
                                placeholder="Ejemplo: 250000"
                                required>

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Estado
                            </label>

                            <select
                                id="estadoVenta"
                                class="form-select"
                                required>

                                <option value="">
                                    Selecciona un estado
                                </option>

                                <option value="Aprobada">
                                    Aprobada
                                </option>

                                <option value="Pendiente">
                                    Pendiente
                                </option>

                                <option value="Cancelada">
                                    Cancelada
                                </option>

                            </select>

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
                    onclick="agregarVenta()">

                    Guardar venta

                </button>

            </div>

        </div>

    </div>

</div>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

<script>

    function agregarVenta() {

        const asesor =
                document.getElementById("asesorVenta").value;

        const cliente =
                document.getElementById("clienteVenta").value.trim();

        const producto =
                document.getElementById("productoVenta").value;

        const fecha =
                document.getElementById("fechaVenta").value;

        const monto =
                parseFloat(
                    document.getElementById("montoVenta").value
                );

        const estado =
                document.getElementById("estadoVenta").value;

        if (
            asesor === "" ||
            cliente === "" ||
            producto === "" ||
            fecha === "" ||
            isNaN(monto) ||
            estado === ""
        ) {

            alert("Completa todos los campos.");

            return;
        }

        const tbody =
                document.getElementById("tablaVentas");

        const totalFilas =
                tbody.querySelectorAll("tr").length + 1;

        const id =
                "V" + String(totalFilas).padStart(3, "0");

        const fechaFormateada =
                formatearFecha(fecha);

        let claseEstado = "";

        if (estado === "Aprobada") {

            claseEstado = "status-aprobada";

        } else if (estado === "Pendiente") {

            claseEstado = "status-pendiente";

        } else {

            claseEstado = "status-cancelada";

        }

        const fila =
                document.createElement("tr");

        fila.setAttribute("data-monto", monto);

        fila.innerHTML =
                "<td>" + id + "</td>" +
                "<td>" + asesor + "</td>" +
                "<td>" + cliente + "</td>" +
                "<td>" + producto + "</td>" +
                "<td>" + fechaFormateada + "</td>" +
                "<td>" + formatoMoneda(monto) + "</td>" +
                "<td>" +
                    "<span class='" + claseEstado + "'>" +
                        estado +
                    "</span>" +
                "</td>";

        tbody.appendChild(fila);

        document
            .getElementById("formVenta")
            .reset();

        actualizarIndicadores();

        const modalElemento =
                document.getElementById("modalVenta");

        const modal =
                bootstrap.Modal.getInstance(modalElemento);

        modal.hide();
    }

    function filtrarVentas() {

        const texto =
                document
                    .getElementById("buscadorVenta")
                    .value
                    .toLowerCase();

        const filas =
                document.querySelectorAll("#tablaVentas tr");

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
                document.querySelectorAll("#tablaVentas tr");

        let totalMonto = 0;
        let aprobadas = 0;

        filas.forEach(function(fila) {

            const monto =
                    parseFloat(
                        fila.getAttribute("data-monto")
                    );

            totalMonto += monto;

            const contenido =
                    fila.textContent.toLowerCase();

            if (contenido.includes("aprobada")) {

                aprobadas++;

            }

        });

        const totalVentas =
                filas.length;

        const promedio =
                totalVentas > 0
                ? totalMonto / totalVentas
                : 0;

        document
            .getElementById("totalVentas")
            .textContent = totalVentas;

        document
            .getElementById("montoTotal")
            .textContent = formatoMoneda(totalMonto);

        document
            .getElementById("ventasAprobadas")
            .textContent = aprobadas;

        document
            .getElementById("ticketPromedio")
            .textContent = formatoMoneda(promedio);
    }

    function formatearFecha(fecha) {

        const partes =
                fecha.split("-");

        return partes[2] + "/" +
               partes[1] + "/" +
               partes[0];
    }

    function formatoMoneda(numero) {

        return new Intl.NumberFormat(
            "es-MX",
            {
                style: "currency",
                currency: "MXN",
                maximumFractionDigits: 0
            }
        ).format(numero);
    }

</script>

</body>

</html>