<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Brokian Performance | Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{

            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;

            background:linear-gradient(135deg,#103B63,#20D3B7);

        }

        .login-card{

            width:420px;
            background:white;
            border-radius:20px;
            padding:45px;
            text-align:center;

            box-shadow:0 15px 35px rgba(0,0,0,.18);

        }

        .login-card img{

            width:140px;
            margin-bottom:10px;

        }

        h1{

            color:#12315D;
            font-weight:bold;
            margin-bottom:10px;

        }

        p{

            color:#666;
            margin-bottom:25px;

        }

        .form-control{

            height:50px;
            margin-bottom:18px;
            border-radius:10px;

        }

        .btn-login{

            background:#20D3B7;
            color:white;
            font-weight:bold;
            height:50px;
            border:none;
            border-radius:10px;

        }

        .btn-login:hover{

            background:#15b89f;

        }

        .footer{

            margin-top:20px;
            font-size:13px;
            color:#888;

        }

    </style>

</head>

<body>

<div class="login-card">

    <img src="img/brokian.png">

    <h1>Brokian Performance</h1>

    <p>Sistema Integral de Gestión del Desempeño</p>

    <form action="dashboard.jsp" method="get">

        <input
            type="text"
            class="form-control"
            placeholder="Usuario"
            required>

        <input
            type="password"
            class="form-control"
            placeholder="Contraseña"
            required>

        <button
            class="btn btn-login w-100"
            type="submit">

            Iniciar sesión

        </button>

    </form>

    <div class="footer">

        © 2026 Brokian Performance

    </div>

</div>

</body>

</html>