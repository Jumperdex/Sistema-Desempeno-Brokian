<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brokian Performance | Empleados</title>

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

        .status-active {
            display: inline-block;
            background: #dff7eb;
            color: #15824f;
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

    <a href="empleados.jsp" class="active">
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
            <h1 class="fw-bold mb-1">Empleados</h1>

            <p class="text-muted mb-0">
                Administración y seguimiento del personal
            </p>
        </div>

        <button class="btn btn-brokian px-4"
                data-bs-toggle="modal"
                data-bs-target="#modalEmpleado">

            <i class="fa-solid fa-user-plus me-2"></i>

            Nuevo empleado

        </button>

    </div>

    <div class="row g-4 mb-4">

        <div class="col-md-4">
            <div class="panel">

                <span class="text-muted">
                    Total de empleados
                </span>

                <h2 class="fw-bold mt-2" id="totalEmpleados">
                    5
                </h2>

            </div>
        </div>

        <div class="col-md-4">
            <div class="panel">

                <span class="text-muted">
                    Empleados activos
                </span>

                <h2 class="fw-bold mt-2 text-success" id="empleadosActivos">
                    5
                </h2>

            </div>
        </div>

        <div class="col-md-4">
            <div class="panel">

                <span class="text-muted">
                    Áreas registradas
                </span>

                <h2 class="fw-bold mt-2 text-primary">
                    2
                </h2>

            </div>
        </div>

    </div>

    <div class="panel">

        <div class="d-flex justify-content-between align-items-center mb-4">

            <h4 class="fw-bold mb-0">
                Listado de empleados
            </h4>

            <input type="text"
                   id="buscadorEmpleado"
                   class="form-control"
                   placeholder="Buscar empleado"
                   style="max-width: 280px;"
                   onkeyup="filtrarEmpleados()">

        </div>

        <div class="table-responsive">

            <table class="table align-middle">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Puesto</th>
                        <th>Área</th>
                        <th>Meta mensual</th>
                        <th>Estado</th>
                    </tr>
                </thead>

                <tbody id="tablaEmpleados">

                    <tr>
                        <td>001</td>
                        <td>Juan Pérez</td>
                        <td>Asesor de ventas</td>
                        <td>Comercial</td>
                        <td>10 ventas</td>
                        <td>
                            <span class="status-active">
                                Activo
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td>002</td>
                        <td>María López</td>
                        <td>Asesora de ventas</td>
                        <td>Comercial</td>
                        <td>10 ventas</td>
                        <td>
                            <span class="status-active">
                                Activo
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td>003</td>
                        <td>Carlos Ramírez</td>
                        <td>Asesor de ventas</td>
                        <td>Comercial</td>
                        <td>8 ventas</td>
                        <td>
                            <span class="status-active">
                                Activo
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td>004</td>
                        <td>Ana Torres</td>
                        <td>Supervisora</td>
                        <td>Operaciones</td>
                        <td>Seguimiento general</td>
                        <td>
                            <span class="status-active">
                                Activo
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td>005</td>
                        <td>Luis García</td>
                        <td>Asesor de ventas</td>
                        <td>Comercial</td>
                        <td>8 ventas</td>
                        <td>
                            <span class="status-active">
                                Activo
                            </span>
                        </td>
                    </tr>

                </tbody>

            </table>

        </div>

    </div>

</main>

<div class="modal fade" id="modalEmpleado" tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Registrar nuevo empleado
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body">

                <form id="formEmpleado">

                    <div class="mb-3">

                        <label class="form-label">
                            Nombre completo
                        </label>

                        <input type="text"
                               id="nombreEmpleado"
                               class="form-control"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">
                            Puesto
                        </label>

                        <input type="text"
                               id="puestoEmpleado"
                               class="form-control"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">
                            Área
                        </label>

                        <select id="areaEmpleado"
                                class="form-select"
                                required>

                            <option value="">
                                Selecciona un área
                            </option>

                            <option value="Comercial">
                                Comercial
                            </option>

                            <option value="Operaciones">
                                Operaciones
                            </option>

                            <option value="Recursos Humanos">
                                Recursos Humanos
                            </option>

                            <option value="Administración">
                                Administración
                            </option>

                        </select>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">
                            Meta mensual
                        </label>

                        <input type="text"
                               id="metaEmpleado"
                               class="form-control"
                               placeholder="Ejemplo: 10 ventas"
                               required>

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
                        onclick="agregarEmpleado()">

                    Guardar empleado

                </button>

            </div>

        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>

    function agregarEmpleado() {

        const nombre =
                document.getElementById("nombreEmpleado").value.trim();

        const puesto =
                document.getElementById("puestoEmpleado").value.trim();

        const area =
                document.getElementById("areaEmpleado").value;

        const meta =
                document.getElementById("metaEmpleado").value.trim();

        if (nombre === "" ||
            puesto === "" ||
            area === "" ||
            meta === "") {

            alert("Completa todos los campos.");

            return;
        }

        const tbody =
                document.getElementById("tablaEmpleados");

        const totalFilas =
                tbody.querySelectorAll("tr").length + 1;

        const id =
                String(totalFilas).padStart(3, "0");

        const fila =
                document.createElement("tr");

        fila.innerHTML =
                "<td>" + id + "</td>" +
                "<td>" + nombre + "</td>" +
                "<td>" + puesto + "</td>" +
                "<td>" + area + "</td>" +
                "<td>" + meta + "</td>" +
                "<td>" +
                    "<span class='status-active'>" +
                        "Activo" +
                    "</span>" +
                "</td>";

        tbody.appendChild(fila);

        document.getElementById("formEmpleado").reset();

        actualizarContadores();

        const modalElemento =
                document.getElementById("modalEmpleado");

        const modal =
                bootstrap.Modal.getInstance(modalElemento);

        modal.hide();
    }

    function filtrarEmpleados() {

        const texto =
                document
                    .getElementById("buscadorEmpleado")
                    .value
                    .toLowerCase();

        const filas =
                document.querySelectorAll("#tablaEmpleados tr");

        filas.forEach(function(fila) {

            const contenido =
                    fila.textContent.toLowerCase();

            if (contenido.includes(texto)) {

                fila.style.display = "";

            } else {

                fila.style.display = "none";

            }

        });
    }

    function actualizarContadores() {

        const total =
                document.querySelectorAll(
                    "#tablaEmpleados tr"
                ).length;

        document.getElementById(
            "totalEmpleados"
        ).textContent = total;

        document.getElementById(
            "empleadosActivos"
        ).textContent = total;
    }

</script>

</body>
</html>