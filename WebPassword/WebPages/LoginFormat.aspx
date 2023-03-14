<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginFormat.aspx.cs" Inherits="WebPassword.WebPages.LoginFormat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login and Registration Page</title>
    <link rel="stylesheet" href="Estilo.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
</head>



<body>
    <header>
        
        <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fappsourcing.net%2Fcrear-contrasena-mas-segura%2F&psig=AOvVaw2P6vlmAg2YxX9uDYo2D80h&ust=1677967545210000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCOi0ga7iwP0CFQAAAAAdAAAAABAE" 
            alt="texto_alternativo" width="100px" height="100px"/>
        <h1 class="text-center">SAFE PASSWORD</h1>

    </header>
    <!-- div del Display que divide en 2 la pantalla -->
    <div style="display: flex; align-items: center; justify-content: space-between;">
        <!-- div que contiene en Generador de Contraseñas -->
        <div id="mi-div-pg" style="width: 50%;">
            <div class="row">
                
                <form runat="server">
                    <h2 class="text-center">Generador de contraseñas</h2>
                    <div class="form-group">
                        <label for="txtLength">Longitud:</label>
                        <input type="number" class="form-control" id="txtLength" runat="server" min="8" max="100" value="8">
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
                    <div class="form-group">
                    <label for="txtGeneratedPassword">Contraseña:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="txtGeneratedPassword" runat="server" readonly>
                        <div class="input-group-append">
                            <button type="button" class="btn btn-outline-secondary" id="btnRegenerate" runat="server" onclick="btnRegenerate_Click">Regenerar</button>
                        </div>
                    </div>
                </div>
                </form>
                
            </div>
        </div>

        <!-- fin del div de contraseñas -->

        <!-- Div que contiene en inicio de sesion -->
        <div class="mi-div" style="width: 40%;">
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
        <!-- fin div inicio de sesión -->
    </div>
    <!-- fin div displey -->

     <!-- Div que contiene Registro -->
        <div class="mi-div">
            <div class="card p-3">
                    <h2 class="text-center">Registrarse</h2>
                    <div class="form-group">
                        <label for="txtRegUsernam">Correo Electrónico:</label>
                        <asp:TextBox ID="txtRegUsernam" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRegUsernam" runat="server" ControlToValidate="txtRegUsernam"
                            ErrorMessage="El campo Correo Electrónico es requerido"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revRegUsernam" runat="server" ControlToValidate="txtRegUsernam"
                            ErrorMessage="Ingrese un correo electrónico válido" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtRegPassword">Contraseña:</label>
                        <asp:TextBox ID="txtRegPassword1" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtRegPassword1"
                            ErrorMessage="El campo Contraseña es requerido"></asp:RequiredFieldValidator>
                    </div>
                    
                    <asp:Button ID="btnRegister1" runat="server" CssClass="btn btn-primary" Text="Ingresar"  />
                <div class="form-group">
                        <label for="txtRegPassword">Contraseña:</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRegPassword1"
                            ErrorMessage="El campo Contraseña es requerido"></asp:RequiredFieldValidator>
                    </div>
                </div>

        </div>
        <!-- fin div inicio de sesión -->


</body>


</html>
