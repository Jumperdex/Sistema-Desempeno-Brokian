<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brokian Performance | Asistencia</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
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
            background: white;
            border-radius: 8px;
            padding: 8px;
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
            background: white;
            border-radius: 16px;
            padding: 25px;
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

        .status-puntual {
            display: inline-block;
            background: #dff7eb;
            color: #15824f;
            padding: 6px 10px;
            border-radius: 20px;
            font-weight: 600;
        }

        .status-retardo {
            display: inline-block;
            background: #fff2d9;
            color: #b36c00;
            padding: 6px 10px;
            border-radius: 20px;
            font-weight: 600;
        }

        .status-falta {
            display: inline-block;
            background: #ffe1e1;
            color: #b72f2f;
            padding: 6px 10px;
            border-radius: 20px;
            font-weight: 600;
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

    <img src="img/brokian.png" class="logo" alt="Logo Brokian">

    <div class="menu-title">MENÚ PRINCIPAL</div>

    <a href="dashboard.jsp">
        <i class="fa-solid fa-chart-line"></i>
        Dashboard
    </a>

    <a href="empleados.jsp">
        <i class="fa-solid fa-users"></i>
        Empleados
    </a>

    <a href="asistencia.jsp" class="active">
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

    <a href="reportes.jsp">
        <i class="fa-solid fa-file-lines"></i>
        Reportes
    </a>

    <div class="menu-title">SESIÓN</div>

    <a href="login.jsp">
        <i class="fa-solid fa-right-from-bracket"></i>
        Cerrar sesión
    </a>

</aside>

<main class="main">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h1 class="fw-bold mb-1">Asistencia</h1>

            <p class="text-muted mb-0">
                Control de entradas, salidas, retardos y faltas
            </p>
        </div>

        <button class="btn btn-brokian px-4"
                data-bs-toggle="modal"
                data-bs-target="#modalAsistencia">

            <i class="fa-solid fa-calendar-plus me-2"></i>

            Nuevo registro

        </button>

    </div>

    <div class="row g-4 mb-4">

        <div class="col-md-3">
            <div class="panel">
                <span class="text-muted">Registros del día</span>
                <h2 class="fw-bold mt-2" id="totalRegistros">5</h2>
            </div>
        </div>

        <div class="col-md-3">
            <div class="panel">
                <span class="text-muted">Puntuales</span>
                <h2 class="fw-bold mt-2 text-success" id="totalPuntuales">3</h2>
            </div>
        </div>

        <div class="col-md-3">
            <div class="panel">
                <span class="text-muted">Retardos</span>
                <h2 class="fw-bold mt-2 text-warning" id="totalRetardos">1</h2>
            </div>
        </div>

        <div class="col-md-3">
            <div class="panel">
                <span class="text-muted">Faltas</span>
                <h2 class="fw-bold mt-2 text-danger" id="totalFaltas">1</h2>
            </div>
        </div>

    </div>

    <div class="panel">

        <div class="d-flex justify-content-between align-items-center mb-4">

            <h4 class="fw-bold mb-0">
                Registro de asistencia
            </h4>

            <input type="text"
                   id="buscadorAsistencia"
                   class="form-control"
                   placeholder="Buscar empleado o estado"
                   style="max-width: 300px;"
                   onkeyup="filtrarAsistencia()">

        </div>

        <div class="table-responsive">

            <table class="table align-middle">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Empleado</th>
                        <th>Fecha</th>
                        <th>Entrada</th>
                        <th>Salida</th>
                        <th>Estado</th>
                    </tr>
                </thead>

                <tbody id="tablaAsistencia">

                    <tr>
                        <td>001</td>
                        <td>Juan Pérez</td>
                        <td>05/08/2026</td>
                        <td>08:02</td>
                        <td>17:05</td>
                        <td>
                            <span class="status-puntual">Puntual</span>
                        </td>
                    </tr>

                    <tr>
                        <td>002</td>
                        <td>María López</td>
                        <td>05/08/2026</td>
                        <td>08:00</td>
                        <td>17:01</td>
                        <td>
                            <span class="status-puntual">Puntual</span>
                        </td>
                    </tr>

                    <tr>
                        <td>003</td>
                        <td>Carlos Ramírez</td>
                        <td>05/08/2026</td>
                        <td>08:18</td>
                        <td>17:10</td>
                        <td>
                            <span class="status-retardo">Retardo</span>
                        </td>
                    </tr>

                    <tr>
                        <td>004</td>
                        <td>Ana Torres</td>
                        <td>05/08/2026</td>
                        <td>07:58</td>
                        <td>17:03</td>
                        <td>
                            <span class="status-puntual">Puntual</span>
                        </td>
                    </tr>

                    <tr>
                        <td>005</td>
                        <td>Luis García</td>
                        <td>05/08/2026</td>
                        <td>-</td>
                        <td>-</td>
                        <td>
                            <span class="status-falta">Falta</span>
                        </td>
                    </tr>

                </tbody>

            </table>

        </div>

    </div>

</main>

<div class="modal fade" id="modalAsistencia" tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Registrar asistencia
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body">

                <form id="formAsistencia">

                    <div class="mb-3">

                        <label class="form-label">
                            Empleado
                        </label>

                        <select id="empleadoAsistencia"
                                class="form-select"
                                required>

                            <option value="">
                                Selecciona un empleado
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

                            <option value="Ana Torres">
                                Ana Torres
                            </option>

                            <option value="Luis García">
                                Luis García
                            </option>

                        </select>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">
                            Fecha
                        </label>

                        <input type="date"
                               id="fechaAsistencia"
                               class="form-control"
                               required>

                    </div>

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Hora de entrada
                            </label>

                            <input type="time"
                                   id="horaEntrada"
                                   class="form-control">

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">
                                Hora de salida
                            </label>

                            <input type="time"
                                   id="horaSalida"
                                   class="form-control">

                        </div>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">
                            Estado
                        </label>

                        <select id="estadoAsistencia"
                                class="form-select"
                                required>

                            <option value="">
                                Selecciona un estado
                            </option>

                            <option value="Puntual">
                                Puntual
                            </option>

                            <option value="Retardo">
                                Retardo
                            </option>

                            <option value="Falta">
                                Falta
                            </option>

                        </select>

                    </div>

                </form>

            </div>

            <div class="modal-footer">

                <button type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">

                    Cancelar

                </button>

                <button type="button"
                        class="btn btn-brokian"
                        onclick="agregarAsistencia()">

                    Guardar registro

                </button>

            </div>

        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>

    function agregarAsistencia() {

        const empleado =
                document.getElementById("empleadoAsistencia").value;

        const fecha =
                document.getElementById("fechaAsistencia").value;

        const entrada =
                document.getElementById("horaEntrada").value;

        const salida =
                document.getElementById("horaSalida").value;

        const estado =
                document.getElementById("estadoAsistencia").value;

        if (empleado === "" || fecha === "" || estado === "") {
            alert("Completa los campos obligatorios.");
            return;
        }

        const tbody =
                document.getElementById("tablaAsistencia");

        const totalFilas =
                tbody.querySelectorAll("tr").length + 1;

        const id =
                String(totalFilas).padStart(3, "0");

        const fechaFormateada =
                formatearFecha(fecha);

        let claseEstado = "";

        if (estado === "Puntual") {
            claseEstado = "status-puntual";
        } else if (estado === "Retardo") {
            claseEstado = "status-retardo";
        } else {
            claseEstado = "status-falta";
        }

        const entradaMostrar =
                estado === "Falta" ? "-" : (entrada || "-");

        const salidaMostrar =
                estado === "Falta" ? "-" : (salida || "-");

        const fila =
                document.createElement("tr");

        fila.innerHTML =
                "<td>" + id + "</td>" +
                "<td>" + empleado + "</td>" +
                "<td>" + fechaFormateada + "</td>" +
                "<td>" + entradaMostrar + "</td>" +
                "<td>" + salidaMostrar + "</td>" +
                "<td>" +
                    "<span class='" + claseEstado + "'>" +
                        estado +
                    "</span>" +
                "</td>";

        tbody.appendChild(fila);

        document.getElementById("formAsistencia").reset();

        actualizarContadores();

        const modalElemento =
                document.getElementById("modalAsistencia");

        const modal =
                bootstrap.Modal.getInstance(modalElemento);

        modal.hide();
    }

    function filtrarAsistencia() {

        const texto =
                document
                    .getElementById("buscadorAsistencia")
                    .value
                    .toLowerCase();

        const filas =
                document.querySelectorAll("#tablaAsistencia tr");

        filas.forEach(function(fila) {

            const contenido =
                    fila.textContent.toLowerCase();

            fila.style.display =
                    contenido.includes(texto) ? "" : "none";

        });
    }

    function actualizarContadores() {

        const filas =
                document.querySelectorAll("#tablaAsistencia tr");

        let puntuales = 0;
        let retardos = 0;
        let faltas = 0;

        filas.forEach(function(fila) {

            const texto =
                    fila.textContent.toLowerCase();

            if (texto.includes("puntual")) {
                puntuales++;
            }

            if (texto.includes("retardo")) {
                retardos++;
            }

            if (texto.includes("falta")) {
                faltas++;
            }

        });

        document.getElementById("totalRegistros").textContent =
                filas.length;

        document.getElementById("totalPuntuales").textContent =
                puntuales;

        document.getElementById("totalRetardos").textContent =
                retardos;

        document.getElementById("totalFaltas").textContent =
                faltas;
    }

    function formatearFecha(fecha) {

        const partes = fecha.split("-");

        return partes[2] + "/" +
               partes[1] + "/" +
               partes[0];
    }

</script>

</body>
</html>