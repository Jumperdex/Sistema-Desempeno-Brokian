<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Brokian Performance | Dashboard</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
        }

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

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .topbar h1 {
            margin: 0;
            font-weight: 750;
        }

        .user-box {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 9px 15px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.06);
        }

        .kpi-card {
            min-height: 145px;
            padding: 24px;
            border: none;
            border-radius: 16px;
            color: white;
            box-shadow: 0 8px 25px rgba(15, 42, 76, 0.12);
        }

        .kpi-card i {
            font-size: 30px;
            opacity: 0.9;
        }

        .kpi-card h3 {
            margin: 14px 0 3px;
            font-size: 30px;
            font-weight: 750;
        }

        .kpi-card p {
            margin: 0;
            opacity: 0.9;
        }

        .bg-sales {
            background: linear-gradient(135deg, #159447, #20bd65);
        }

        .bg-goals {
            background: linear-gradient(135deg, #0b67d1, #2288f5);
        }

        .bg-attendance {
            background: linear-gradient(135deg, #e88d0a, #ffad28);
        }

        .bg-calls {
            background: linear-gradient(135deg, #7244c7, #9169dd);
        }

        .panel {
            height: 100%;
            padding: 24px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(15, 42, 76, 0.08);
        }

        .panel h4 {
            margin-bottom: 22px;
            font-weight: 700;
        }

        .progress {
            height: 16px;
            border-radius: 20px;
        }

        .activity-item {
            display: flex;
            justify-content: space-between;
            padding: 13px 0;
            border-bottom: 1px solid #edf1f5;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .badge-soft {
            padding: 7px 10px;
            border-radius: 20px;
            background: #e3f8f3;
            color: #13866f;
            font-weight: 600;
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

        <img src="img/brokian.png" alt="Logo Brokian" class="logo">

        <div class="menu-title">MENÚ PRINCIPAL</div>

        <a href="dashboard.jsp" class="active">
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

        <div class="topbar">
            <div>
                <h1>Dashboard</h1>
                <span class="text-muted">
                    Resumen general del desempeño del equipo
                </span>
            </div>

            <div class="user-box">
                <i class="fa-solid fa-circle-user fa-2x"></i>

                <div>
                    <strong>Administrador</strong>
                    <div class="text-muted small">
                        Brokian Consumidores
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-4 mb-4">

            <div class="col-xl-3 col-md-6">
                <div class="kpi-card bg-sales">
                    <i class="fa-solid fa-sack-dollar"></i>
                    <h3>$1,250,000</h3>
                    <p>Ventas del mes</p>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="kpi-card bg-goals">
                    <i class="fa-solid fa-bullseye"></i>
                    <h3>85%</h3>
                    <p>Cumplimiento de metas</p>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="kpi-card bg-attendance">
                    <i class="fa-solid fa-user-check"></i>
                    <h3>95%</h3>
                    <p>Asistencia promedio</p>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="kpi-card bg-calls">
                    <i class="fa-solid fa-phone"></i>
                    <h3>2,350</h3>
                    <p>Llamadas realizadas</p>
                </div>
            </div>

        </div>

        <div class="row g-4">

            <div class="col-lg-7">
                <div class="panel">

                    <h4>Rendimiento general</h4>

                    <div class="mb-4">
                        <div class="d-flex justify-content-between mb-2">
                            <span>Ventas</span>
                            <strong>88%</strong>
                        </div>

                        <div class="progress">
                            <div class="progress-bar bg-success"
                                 style="width: 88%">
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <div class="d-flex justify-content-between mb-2">
                            <span>Metas</span>
                            <strong>85%</strong>
                        </div>

                        <div class="progress">
                            <div class="progress-bar"
                                 style="width: 85%">
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <div class="d-flex justify-content-between mb-2">
                            <span>Asistencia</span>
                            <strong>95%</strong>
                        </div>

                        <div class="progress">
                            <div class="progress-bar bg-warning"
                                 style="width: 95%">
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Citas agendadas</span>
                            <strong>76%</strong>
                        </div>

                        <div class="progress">
                            <div class="progress-bar bg-info"
                                 style="width: 76%">
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-5">
                <div class="panel">

                    <h4>Actividad reciente</h4>

                    <div class="activity-item">
                        <span>María López registró una venta</span>
                        <span class="badge-soft">$25,000</span>
                    </div>

                    <div class="activity-item">
                        <span>Juan Pérez agendó una cita</span>
                        <span class="text-muted">Hace 25 min</span>
                    </div>

                    <div class="activity-item">
                        <span>Carlos Ramírez registró 5 llamadas</span>
                        <span class="text-muted">Hace 40 min</span>
                    </div>

                    <div class="activity-item">
                        <span>Ana Torres registró su asistencia</span>
                        <span class="text-muted">Hace 1 hora</span>
                    </div>

                    <div class="activity-item">
                        <span>Meta mensual actualizada</span>
                        <span class="text-muted">Hace 2 horas</span>
                    </div>

                </div>
            </div>

        </div>

    </main>

</body>
</html>