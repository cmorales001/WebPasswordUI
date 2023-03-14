<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFSession.aspx.cs" Inherits="WebPassword.WebPages.WFSession" %>

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
        <div class="container">
            <div class="row">
                <div class="col-md-3">

                    <img src="https://appsourcing.net/wp-content/uploads/elementor/thumbs/blog-contrasena-segura-nr5i5ffz90hnvo26tuurj79pnvzjkk4n9n5hvz0dk6.jpg"
                        alt="texto_alternativo" width="150px" height="100px" />

                </div>
                <div class="col-md-6">
                    <h1 class="text-center">SAFE PASSWORD</h1>
                </div>
                <div class="col-md-6">
                    <h5 class="text-center">Contraseñas Seguras para tu tranquilidad</h5>
                    <asp:Label ID="labelNombreUser" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </header>
    <form id="form1" runat="server">
        <div class="mi-div2">
            <div class="row">
            <div class="col-md-4">
                <h2 class="text-center">GENERADOR DE CONTRASEÑAS SEGURAS</h2>
                <div class="form-group">
                    <label for="txtGeneratedPassword">Tu contraseña:</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtGeneratedPassword1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                        <div class="input-group-append">
                            <asp:Button ID="btnRegenerate1" runat="server" CssClass="btn btn-outline-secondary" Text="Copiar" />

                        </div>
                    </div>
                </div>
                    <div class="form-group">
                        <hr />
                    </div>
                <h3 class="text-center">PERSONALIZA TU CONTRASEÑA</h3>
                    <div class="form-group">
                        <label for="txtLength">Longitud:</label>
                        <input type="number" class="form-control" id="txtLength" runat="server" min="8" max="32" value="8"/>
                    </div>
                    <div class="form-check">
                        <asp:CheckBox ID="chkSpecialChars1" runat="server" CssClass="form-check-input" Checked="False" />

                        <label class="form-check-label" for="chkSpecialChars1">Incluir caracteres especiales</label>
                    </div>
                    <div class="form-check">
                        <asp:CheckBox ID="chkNumbers" runat="server" CssClass="form-check-input" Checked="False" />
                        <label class="form-check-label" for="chkNumbers">Incluir Números</label>
                    </div>
                    <br />
                    <h4 class="text-center">Genera tu contraseña:</h4>
                    <br />
                    <asp:Button ID="btnGeneratePass" runat="server" CssClass="btn btn-primary" Text="Contraseña personalizada" OnClick="btnGeneratePass_Click"  />
                    <asp:Button ID="btnCopy1" runat="server" CssClass="btn btn-primary" Text="Facil de Recordar" OnClick="btnCopy1_Click"  />

                
                
            </div>
            <div class="col-md-6 col-lg-4 justify-content-end ml-auto">
                <div class="card p-3">
                    <br />
                    <br />
                    <h2 class="text-center">Inicio de Sesion</h2>
                    <div class="form-group">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                            OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                <asp:TemplateField HeaderText="Apellido">
                                    <ItemTemplate>
                                        <asp:Label ID="lblApellido" runat="server" Text='<%# Eval("Apellido") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtApellido" runat="server" Text='<%# Bind("Apellido") %>' TextMode="Password"></asp:TextBox>
                                        <asp:Button ID="btnShowPassword" runat="server" Text="Mostrar" CommandName="ShowPassword" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                                <asp:ButtonField ButtonType="Button" Text="Copiar" CommandName="CopyRow" />
                            </Columns>
                        </asp:GridView>


                    </div>
                    
                </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
