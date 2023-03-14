<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginR.aspx.cs" Inherits="WebPassword.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login and Registration Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>


<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h2 class="text-center">Generador de contraseñas</h2>
                <form runat="server">
                    <div class="form-group">
                        <label for="txtLength">Longitud:</label>
                        <input type="number" class="form-control" id="txtLength" runat="server" min="1" max="100" value="8">
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="chkSpecialChars" runat="server">
                        <label class="form-check-label" for="chkSpecialChars">Incluir caracteres especiales</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="chkDigits" runat="server">
                        <label class="form-check-label" for="chkDigits">Incluir Digitos</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="chkUpperCase" runat="server">
                        <label class="form-check-label" for="chkUpperCase">Incluir Mayusculas</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="chkLowerCase" runat="server">
                        <label class="form-check-label" for="chkLowerCase">Incluir Minusculas</label>
                    </div>
                    <br />
                    <br />
                    <button type="submit" class="btn btn-primary" id="btnGenerate" runat="server" onclick="btnGenerate_Click">Generar Contraseña</button>
                    <button type="button" class="btn btn-secondary" id="btnCopy" runat="server" onclick="btnCopy_Click" disabled>Copiar Contraseña</button>
                </form>
                <div class="form-group">
                    <label for="txtGeneratedPassword">Generar Contraseña:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="txtGeneratedPassword" runat="server" readonly>
                        <div class="input-group-append">
                            <button type="button" class="btn btn-outline-secondary" id="btnRegenerate" runat="server" onclick="btnRegenerate_Click">Regenerar</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 justify-content-end ml-auto">
                <div class="card p-3">
                    <br />
                    <br />
                    <h2 class="text-center">Inicio de Sesion</h2>
                    <div class="form-group">
                        <label for="txtUsername">Usuario</label>
                        <input type="text" class="form-control" id="txtUsername" runat="server">
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <input type="password" class="form-control" id="txtPassword" runat="server">
                    </div>
                    <button type="submit" class="btn btn-primary" id="btnLogin" runat="server" onclick="btnLogin_Click">Inicio de Sesion</button>
                </div>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-6 col-lg-4 justify-content-end ml-auto">
                <div class="card p-3">
                    <h2 class="text-center">Registrarse</h2>
                    <div class="form-group">
                        <label for="txtRegUsername">Usuario</label>
                        <input type="text" class="form-control" id="txtRegUsername" runat="server">
                    </div>
                    <div class="form-group">
                        <label for="txtRegPassword">Password</label>
                        <input type="password" class="form-control" id="txtRegPassword" runat="server">
                    </div>
                    <div class="form-group">
                        <label for="txtRegConfirmPassword">Confirmar contraseña</label>
                        <input type="password" class="form-control" id="txtRegConfirmPassword" runat="server">
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <input type="email" class="form-control" id="txtEmail" runat="server" />
                    </div>
                    <button type="submit" class="btn btn-primary" id="btnRegister" runat="server" onclick="btnRegister_Click">Registrarse</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
