<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PerfectPaginationWithRepeater.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tuanhayho ASP.NET Webform Pagination With Repeater</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        table {
            border-collapse: collapse;
        }

        table, td, th {
            border: 1px solid blue;
        }

        th {
            background-color: dodgerblue;
            color: white;
        }

        .add-person-form {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="MainScriptManager" runat="server" />
        <div>
            <h2>Pagination, hosted by Nguyễn Hữu Anh Tuấn</h2>
        </div>
        <div class="add-person-form">
                    <h2>Add Person</h2>
                    <div>
                        <label for="txtName">Name:</label>
                        <input type="text" id="txtName" runat="server" />
                    </div>
                    <div>
                        <label for="txtAddress">Address:</label>
                        <input type="text" id="txtAddress" runat="server" />
                    </div>
                    <div>
                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />

                    </div>
        </div>


        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <ContentTemplate>
                <div>
                    <asp:Repeater ID="rptResult" runat="server">
                        <HeaderTemplate>
                            <table class="auto-style1">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Created Date</th>
                                </tr>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("Id") %></td>
                                <td><%#Eval("Name") %></td>
                                <td><%#Eval("Address") %></td>
                                <td><%#Eval("createdDate") %></td>
                                <td>
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRecord" CommandArgument='<%# Eval("Id") %>' OnCommand="btnDelete_Command" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>

                        <%--No Record in DB--%>
                        <div>
                            <asp:Label ID="lblNoRecords" runat="server" Text="No Person found!" Visible="false"></asp:Label>
                        </div>
                </div>


                <div style="margin-top: 20px;">
                    <table style="width: 600px;">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbFirst" runat="server" OnClick="lbFirst_Click">First</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbPrevious" runat="server" OnClick="lbPrevious_Click">Previous</asp:LinkButton>
                            </td>
                            <td>
                                <asp:DataList ID="rptPaging" runat="server"
                                    OnItemCommand="rptPaging_ItemCommand"
                                    OnItemDataBound="rptPaging_ItemDataBound" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbPaging" runat="server"
                                            CommandArgument='<%# Eval("PageIndex") %>' CommandName="newPage"
                                            Text='<%# Eval("PageText") %> ' Width="20px"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbNext" runat="server" OnClick="lbNext_Click">Next</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbLast" runat="server" OnClick="lbLast_Click">Last</asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
