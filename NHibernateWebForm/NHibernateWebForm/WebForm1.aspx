<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="NHibernateWebForm.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NHibernateWebformDemo</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top:50px;margin-left:150px; width: 931px;">
            <h3>Student Details </h3>

            <asp:Label runat="server"  Text="StudentName" />
            <asp:TextBox runat="server" ID="sname" style="width:240px;"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" ValidationGroup="insertEdit" runat="server" ControlToValidate="sname" ErrorMessage="Enter Student Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </br></br>

            <asp:Label runat="server"  Text="FatherName" />
            <asp:TextBox runat="server" ID="fname" style="width:240px;" /> </br></br>

            <asp:Label runat="server"  Text="Email Id" />
            <asp:TextBox runat="server" ID="Email" style="width:240px;" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" ValidationGroup="insertEdit" runat="server" ControlToValidate="Email" ErrorMessage="Enter Email Id" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" ValidationGroup="insertEdit" runat="server" 
                ControlToValidate="Email" 
                ErrorMessage="Invalid Email" 
                ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </br></br>

            <asp:Label runat="server"  Text="Address" />
            <asp:TextBox runat="server" ID="address" style="width:240px;" /></br></br>

            <asp:Label runat="server"  Text="Mobile" />
            <asp:TextBox runat="server" ID="mobile" style="width:240px;"/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" ValidationGroup="insertEdit" runat="server" ControlToValidate="mobile" ErrorMessage="Invalid Mobile No" ForeColor="#FF3300" ValidationExpression="^([0-9]{10})$"></asp:RegularExpressionValidator>
            </br></br></br>

            <asp:Button ID="insert" runat="server" type="submit" Text="Insert" OnClick="insert_Click" Width="115px" Height="40px" ValidationGroup="insertEdit" />&nbsp&nbsp
            <asp:Button ID="Read" runat="server" type="button" Text="Read" OnClick="Read_Click" Width="113px" Height="39px" CausesValidation="False" />&nbsp&nbsp
           
           <h3> Results: </h3>
            <span runat="server" id="changed_text" />

            <asp:GridView ID="studentBook" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="black" Width="810px" 
                OnRowEditing="studentBook_RowEditing" OnRowCancelingEdit="studentBook_RowCancelingEdit" OnRowUpdating="studentBook_RowUpdating" OnRowDeleting="studentBook_RowDeleting"  BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" Height="213px" style="margin-top: 0px">

                <Columns>
                    <asp:TemplateField HeaderText="Student Id">
                        <EditItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" style="text-align: center" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Student Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("StudentName") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" ValidationGroup="EditColumn" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Student Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" style="text-align: center" Text='<%# Eval("StudentName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Father Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("FatherName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("FatherName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextEmail" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" ValidationGroup="EditColumn" runat="server" ControlToValidate="TextEmail" ErrorMessage="Enter Email Id" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" ValidationGroup="EditColumn" runat="server" ControlToValidate="TextEmail" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Mobile") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" ValidationGroup="EditColumn" runat="server" ControlToValidate="TextBox4" ErrorMessage="Invalid Mobile No" ForeColor="#FF3300" ValidationExpression="^([0-9]{10})$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Operations">
                        <EditItemTemplate>
                            <asp:LinkButton  ID="LinkButton3" runat="server" CommandName="update"  ValidationGroup="EditColumn">Update</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel" CausesValidation="false">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton  ID="LinkButton1" runat="server" CommandName="Edit" CausesValidation="false">Edit</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;
                            <asp:LinkButton OnClientClick="return confirm('Are You Sure want to Delete');" ID="LinkButton2" runat="server" CommandName="Delete" CausesValidation="false">Delete</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
               
            </asp:GridView>
        </div>
    </form>
</body>
</html>
