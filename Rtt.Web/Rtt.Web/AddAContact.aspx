<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAContact.aspx.cs" Inherits="Rtt.Web.AddAContact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="row contentRow">
        <div class="col-lg-12">
        <a name="topOfPanel" id="topOfPanel"></a> 
            <asp:Panel runat="server" ID="RadPanelBar1" Width="100%" ExpandMode="SingleExpandedItem" Skin="Bootstrap"  onclientitemclicked="OnClientItemClicked">
                <Items>
                    <telerik:RadPanelItem Expanded="True" Text="Contact Information" Value="ContactInformation">
                        <HeaderTemplate>
                            <span class="rpText"><a id="contactInformation" name="contactInformation"></a><i class='fa fa-address-card fa-fw'></i> Contact Information&nbsp;
                                <telerik:RadLabel runat="server" ID="rlContactInformation" CssClass="selectionInformation"></telerik:RadLabel>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HiddenField runat="server" ID="hfContactId" />
                            <asp:HiddenField runat="server" ID="hfContactNo" />
                            <asp:HiddenField runat="server" ID="hfFinQuoteNo"/>
                            <asp:HiddenField runat="server" ID="hfIsLicenseCardLookedUp"/>
                            <asp:HiddenField runat="server" ID="hfLicenseCardResult"/>
                            <div class="row">
                                <div class="col-lg-12">&nbsp;</div>
                            </div>
                        <div class="row" style="margin-top:-40px" runat="server" id="divIdVerification">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <script type="text/javascript">
                                        function OnLicenseCardClientFileSelected(sender) {
                                            var btnClick = document.getElementById('<%=btnUpload.ClientID %>');
                                            btnClick.click();
                                            __doPostBack('btnUpload');
                                        }
                                    </script>
                                    <label class="control-label"></label>
                                </div>
                            </div>
                            <!-- /.col-lg-6 -->
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="control-label">Scan and Upload License Card</label>
                                    <telerik:RadAsyncUpload runat="server" ID="RadUpload" OnFileUploaded="RadUpload_OnFileUploaded" MaxFileInputsCount="1" 
                                                            MultipleFileSelection="Disabled" OnClientFileSelected="OnClientFileSelected" OnClientFilesUploaded="OnLicenseCardClientFileSelected" />
                                    <div id="thumbnail" ></div>
                                    <span style="font-size: x-small; color: green">ID Verification result:&nbsp;<asp:Label runat="server" ID="lblVerificationResult"></asp:Label></span>
                                </div>
                            </div>
                            <!-- /.col-lg-4 -->
                            <div class="col-lg-2">
                                <asp:Button runat="server" ID="btnUpload" Text="Upload" CssClass="btn btn-primary" style="float: right; margin-top: -40px; visibility: hidden" OnClick="btnUpload_OnClick"/>
                                <asp:Image ID="Image1" runat="server" Height="20px" Style="visibility: hidden" Width="20px" />
                            </div>
                        </div>
                        <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group" id="rightParent">
                                        <label class="control-label">ID Type</label>
                                        <asp:DropDownList runat="server" ID="ddlIdType" CssClass="form-control" DataTextField="DESCRIPTION" DataValueField="CODE" OnSelectedIndexChanged="ddlIdType_SelectedIndexChanged" AutoPostBack="true" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group" id="rightParent2">
                                        <label class="control-label" runat="server" id="lblIdNumber">ID Number</label>
                                        <div class="input-group custom-search-form" id="input2">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbIdNumber" placeholder="Enter text" MaxLength="20" data-error="This is not a valid SA ID Number" AutoPostBack="True" OnTextChanged="tbIdNumber_OnTextChanged" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbIdLookup" OnClick="lbIdLookup_OnClick">
                                                    <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                        <p class="help-block" runat="server" id="idNumberError">Format: 7712315046081</p>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6" id="rightTitle">
                                    <a name="bmTitle"></a>
                                    <div class="form-group required" id="vgTitle" runat="server">
                                        <label class="control-label">Title</label>
                                        <asp:DropDownList runat="server" ID="ddlTitle" class="form-control" DataTextField="Abbreviation" DataValueField="IdTitle" required="true" onChange="javascript:setGenderFromTitle();setLanguageFromTitle()" AutoPostBack="False" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-3 -->

                                <%-- TODO dealer param to show
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="control-label">Title (لقب)</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbTitleArabic" placeholder="Enter text" Style="text-transform: capitalize" lang="fa" />
                                    </div>
                                </div> --%>
                                <!-- /.col-lg-3 -->
                                <div class="col-lg-6" id="rightInitials">
                                    <a name="bmInitials"></a>
                                    <div class="form-group required" id="vgInitials" runat="server">
                                        <label class="control-label">Initials</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbInitials" placeholder="Enter text" required="true" Style="text-transform: uppercase" />
                                        <span class="glyphicon form-control-feedback" aria-hidden="true" style="display: none"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6" id="rightFirstName">
                                    <a name="bmFirstname"></a>
                                    <div class="form-group required" id="vgFirstname" runat="server">
                                        <label class="control-label">First Name</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbFirstName" placeholder="Enter text" required="true" AutoPostBack="False" onChange="javascript:firstnameChanged();" Style="text-transform: capitalize" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-3 -->

                                <%-- TODO dealer param to show
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="control-label">First Name (الاسم الأول)</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbFirstNameArabic" placeholder="Enter text" Style="text-transform: capitalize" lang="fa" />
                                    </div>
                                </div> --%>

                                <!-- /.col-lg-3 -->
                                <div class="col-lg-6" id="rightPrefName">
                                    <div class="form-group" id="prefGroup">
                                        <label class="control-label" id="prefNameLabel">Preferred Name</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbPreferredName" placeholder="Enter text" />
                                    </div>
                                </div>
                                <!-- /.col-lg-3 -->

                                <%-- TODO dealer param to show
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="control-label">Last Name (اللقب)</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbLastNameArabic" placeholder="Enter text" Style="text-transform: capitalize" lang="fa" />
                                    </div>
                                </div> --%>
                                <!-- /.col-lg-3 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group required" id="vgLastname" runat="server">
                                        <a name="bmLastName"></a>
                                        <label class="control-label">Last Name</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbSurname" placeholder="Enter text" required="true" Style="text-transform: capitalize" onChange="javascript:surnameChanged();" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <%--<div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Maiden Name</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbMaidenName" placeholder="Enter text" />
                                    </div>
                                </div>--%>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group required" id="vgEmail" runat="server">
                                        <a name="bmEmail"></a>
                                        <label class="control-label">Email</label>
                                        <div class="input-group" id="emailGroup">
                                            <asp:HyperLink runat="server" ID="hlEmail" CssClass="input-group-addon" Text="<span class='glyphicon glyphicon-envelope' aria-hidden='true'>"></asp:HyperLink>
                                            <asp:TextBox CssClass="form-control" placeholder="Enter text" ID="tbEmail" runat="server" AutoPostBack="True" OnTextChanged="tbEmail_OnTextChanged" required="true" type="email" data-error="This is not a valid Email Address" />
                                        </div>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group" id="vgNoEmail" runat="server">
                                        <label class="control-label">&nbsp;</label>
                                        <div class="input-group">
                                            <asp:CheckBox ID="chkNoEmail" runat="server" Text=" Has no Email" onchange="return ToggleEmailValidation();" />
                                        </div>                                        
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6" id="rightMobile">
                                    <a name="bmCellular"></a>
                                    <div class="form-group required" id="vgCellular" runat="server">
                                        <label class="control-label">Cell No</label>
                                        <div class="input-group">
                                            <asp:HyperLink runat="server" ID="hlMobile" CssClass="input-group-addon" Text="<span class='glyphicon glyphicon-phone-alt' aria-hidden='true'>"></asp:HyperLink>
                                            <telerik:RadMaskedTextBox CssClass="form-control" ID="tbMobile" runat="server" RenderMode="Lightweight" Mask="(###)###-####" OnTextChanged="tbMobile_OnTextChanged" AutoPostBack="True" type="number" data-error="At least one contact number is required"></telerik:RadMaskedTextBox>
                                        </div>
                                        <div class="help-block with-errors">At least one contact number is required</div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6" id="rightHomePhone">
                                    <div class="form-group" id="vgHomePhone">
                                        <label class="control-label">Home Telephone</label>
                                        <div class="input-group">
                                            <asp:HyperLink runat="server" ID="hlHomeTel" CssClass="input-group-addon" Text="<span class='glyphicon glyphicon-phone-alt' aria-hidden='true'>"></asp:HyperLink>
                                            <asp:TextBox CssClass="form-control" ID="tbHomeTel" runat="server" RenderMode="Lightweight" Height="34px" Mask="(###)###-####" OnTextChanged="tbHomeTel_OnTextChanged" AutoPostBack="True"></asp:text>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                    <div class="col-lg-6">
                                        <a name="aWorkTel" id="aWorkTel"></a>
                                        <div class="form-group">
                                            <label class="control-label">Work Telephone</label>
                                            <div class="input-group">
                                                <asp:HyperLink runat="server" ID="hlWorkTel" CssClass="input-group-addon" Text="<span class='glyphicon glyphicon-phone-alt' aria-hidden='true'/>"></asp:HyperLink>
                                                <asp:TextBox CssClass="form-control" ID="tbWorkTel" runat="server" RenderMode="Lightweight" Mask="(###)###-####" OnTextChanged="tbWorkTel_OnTextChanged" AutoPostBack="True"></asp:text>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.col-lg-6 -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            
                                        </div>
                                    </div>
                                    <!-- /.col-lg-6 -->
                                </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Date of Birth</label>
                                        <asp:Calendar ID="tbDateOfBirth" runat="server" Width="100%" SkipMinMaxDateValidationOnServer="True" MinDate="1900/01/01">                                            
                                            <place runat="server" ReadOnly="False" EmptyMessage="yyyy/MM/dd"></place>
                                        </asp:cal>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group required" id="vgGender" runat="server">
                                        <label class="control-label">Gender</label>
                                        <asp:DropDownList runat="server" ID="ddlGender" Orientation="Horizontal" CssClass="form-control" required="true">
                                            <asp:ListItem Text="Male" Value="M" />
                                            <asp:ListItem Text="Female" Value="F" />
                                        </asp:DropDownList>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label">Language</label>
                                    <asp:DropDownList runat="server" ID="ddlLanguage" CssClass="form-control" DataTextField="DESCRIPTION" DataValueField="ID" />
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <!-- /.col-lg-6 -->
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label">Internet Access</label>
                                    <asp:DropDownList runat="server" ID="ddlInternetAccess" CssClass="form-control" DataTextField="DESCRIPTION" DataValueField="CODE" />
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <!-- /.col-lg-6 -->
                        </div>
                        <!-- /.row -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label">License Expiry Date</label>
                                    <telerik:RadDatePicker ID="rdpLicenseExpiryDate" runat="server" Width="100%" SkipMinMaxDateValidationOnServer="True" MinDate="1900/01/01">                                            
                                        <DateInput runat="server" ReadOnly="False" EmptyMessage="yyyy/MM/dd"></DateInput>
                                    </telerik:RadDatePicker>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label">License Code</label>
                                    <asp:TextBox runat="server" ID="tbLicenseCode" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row firstRow">
                            <div class="col-lg-6">
                                <a name="bmPointOfContact"></a>
                                <div class="form-group required" id="vgPointOfContact" runat="server">
                                    <label class="control-label">Point of Contact</label>
                                    <asp:DropDownList runat="server" class="form-control" ID="ddlPointOfContact" DataTextField="description" DataValueField="id" required="true" />
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <!-- /.col-lg-6 -->
                            <div class="col-lg-6">
                                <a name="bmOrigin"></a>
                                <div class="form-group required" id="vgOrigin" runat="server">
                                    <label class="control-label">Origin</label>
                                    <asp:DropDownList runat="server" class="form-control" ID="ddlOrigin" DataTextField="description" DataValueField="id" required="true" />
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <!-- /.col-lg-6 -->
                        </div>
                        <!-- /.row -->
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <asp:PanelItem Text="Family Information" Value="FamilyInformation">
                        <HeaderTemplate>
                            <span class="rpText"><a id="familyInformation" name="familyInformation"></a><i class='fa fa-link fa-fw'></i> Family Information&nbsp;
                                <telerik:RadLabel runat="server" ID="rlFamilyInformation" CssClass="selectionInformation"></telerik:RadLabel>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row firstRow">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label class="control-label">Search for a family member</label>
                                        <div class="input-group custom-search-form">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbFamilyMemberName" placeholder="Enter Surname and click search" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbSearchForFamilyMember" OnClick="lbSearchForFamilyMember_OnClick">
                                                    <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>

                                    <%--<telerik:RadListBox RenderMode="Lightweight" ID="RadListBox1" runat="server" Width="256px" Height="320" Skin="MetroTouch"
                                                        DataKeyField="ID" DataValueField="ID"
                                                        DataTextField="First_Name">
                                        <ItemTemplate>--%>
                                    <%--<img class="img-countries" alt='<%# Container.Text %>' src='<%# String.Format("Images/Countries/{0}.png", Container.Text) %>' />--%>
                                    <%--<img class="img-countries" alt='hello' src='Images/favicon-32x32.png' />
                                            <span class="countryName">
                                                <%# Container.Text %>
                                            </span>
                                        </ItemTemplate>
                                    </telerik:RadListBox>--%>
                                    <style type="text/css">
                                        .disablingDiv {
                                            display: none;
                                            z-index: 1001;
                                            position: absolute;
                                            top: 0%;
                                            left: 0%;
                                            width: 100%;
                                            height: 100%;
                                            background-color: white;
                                            opacity: .00;
                                            filter: alpha(opacity=00);
                                        }


                                        .itemDiv,
                                        .selectedDiv {
                                            margin-left: 11px;
                                        }

                                        .selectedDiv {
                                            color: #58954D;
                                        }

                                        .pagerStyle {
                                            margin-bottom: 10px;
                                        }

                                        .radUploadStyle {
                                            float: right;
                                            margin-right: 77px;
                                        }

                                        .RadForm a.rfdSkinnedButton, .RadForm a.rfdSkinnedButton * {
                                            cursor: default;
                                            font: 12px "Segoe UI",Arial,Helvetica,sans-serif !important;
                                            text-align: center;
                                            white-space: nowrap;
                                        }

                                        .fieldset {
                                            float: left;
                                            width: 340px;
                                            min-height: 210px;
                                            padding: 8px 8px;
                                            margin-bottom: 10px;
                                            margin-top: 10px;
                                        }

                                        html .fieldset.fieldsetInsert {
                                            height: auto;
                                            width: 100%;
                                            clear: both;
                                            box-sizing: border-box;
                                        }

                                        .fieldset:first-child {
                                            margin-right: 8px;
                                        }

                                        div.RadListView tr.rlvI td,
                                        div.RadListView tr.rlvIEmpty td {
                                            border: 0 none;
                                        }

                                        div.RadListView {
                                            /*overflow: hidden;*/
                                            border: 0 none;
                                        }

                                        #FiledSet1 {
                                            padding: 4px 8px 10px;
                                        }

                                        .btnEdit,
                                        .btnDelete {
                                            min-width: 70px;
                                            float: left;
                                        }

                                        .btnDelete {
                                            float: right;
                                        }

                                        div.RadListView tr.rlvI > td {
                                            padding-right: 0;
                                        }

                                        .RadListView .rlvI > td:first-child {
                                            vertical-align: top;
                                        }

                                        .dataTable {
                                            height: 200px;
                                            width: 100%;
                                            border-spacing: 0;
                                            margin-top: 20px;
                                        }

                                        .dataTable td {
                                            padding: 0;
                                        }

                                        .mainFieldset {
                                            max-width: 946px;
                                        }

                                        .commandTable > table,
                                        .mainFieldset > table {
                                            width: 100%;
                                            border-spacing: 0;
                                        }

                                        .commandTable td,
                                        .mainFieldset td {
                                            padding: 0;
                                        }

                                        .clearFix {
                                            clear: both;
                                        }

                                        .commandTable {
                                            width: 100%;
                                        }

                                        .insertCell {
                                            width: 25%;
                                        }

                                        .sortCell {
                                            text-align: right;
                                            width: 75%;
                                        }

                                        div.RadForm.rfdRadio input[type="radio"], .RadForm.rfdCheckbox input[type="checkbox"] {
                                            vertical-align: middle;
                                        }

                                        .sortLabel {
                                            padding-right: 5px;
                                        }

                                        .itemTable {
                                            width: 100%;
                                            border-spacing: 0;
                                        }

                                        .innerItemTable {
                                            border-spacing: 0;
                                        }

                                        .itemCellLabel {
                                            width: 25%;
                                        }

                                        .itemCellInfo {
                                            width: 60%;
                                        }

                                        .image {
                                            width: 30%;
                                            padding-left: 10px;
                                            padding-right: 0;
                                            text-align: right;
                                        }

                                        .dataEditTable {
                                            height: 80%;
                                            width: 100%;
                                            border-spacing: 0;
                                        }

                                        .dataEditTable td {
                                            padding: 0;
                                        }

                                        .editTable {
                                            width: 95%;
                                            margin-bottom: 5px;
                                            border-spacing: 3px;
                                        }

                                        .editItemCellLabel {
                                            width: 25%;
                                        }

                                        .editItemCellInfo {
                                            width: 75%;
                                        }

                                        .editImage {
                                            width: 25%;
                                            padding-left: 10px;
                                            text-align: right;
                                        }

                                        .asyncUpload {
                                            float: left;
                                            width: 229px;
                                        }

                                        .commandButton,
                                        .insertCommandButton {
                                            width: 250px;
                                            text-align: right;
                                            padding-top: 20px;
                                        }

                                        .commandButton .RadButton,
                                        .insertCommandButton .RadButton {
                                            margin-left: 10px;
                                        }

                                        .dataInsertTable {
                                            height: 305px;
                                            width: 100%;
                                            border-spacing: 0;
                                        }

                                        .dataInsertTable td {
                                            padding: 0;
                                        }

                                        .insertAsyncUpload {
                                            float: left;
                                            width: 261px;
                                        }

                                        .noRecordsFieldset {
                                            width: 800px;
                                        }

                                        .itemFieldset {
                                            height: 278px;
                                        }

                                        .RadForm_Material .itemFieldset {
                                            height: 332px;
                                        }

                                        .RadForm_Bootstrap .itemFieldset {
                                            height: 310px;
                                        }

                                        .editFieldSet {
                                            margin-top: 4px;
                                        }

                                        .ctl00_ContentPlaceHolder1_RadPanelBar1_i1_pnlTest {
                                            border: 1px solid #ebebeb;
                                            border-radius: 5px;
                                        }
                                    </style>


                                    <asp:Panel ID="pnlTest" runat="server">
                                        <asp:ListView ID="RadListView1" runat="server" RenderMode="Lightweight"
                                            ItemPlaceholderID="CustomersContainer" DataKeyNames="ID" AllowPaging="true"
                                            OnItemCommand="RadListView1_OnItemCommand" OnNeedDataSource="RadListView1_OnNeedDataSource">
                                            <LayoutTemplate>
                                                <!-- Set the id of the wrapping container to match the CLIENT ID of the RadListView control to display the ajax loading panel
                                    In case the listview is embedded in another server control, you will need to append the id of that server control -->

                                                <table>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadDataPager RenderMode="Lightweight" ID="RadDataPager1" runat="server" PagedControlID="RadListView1"
                                                                PageSize="2" CssClass="pagerStyle">
                                                                <Fields>
                                                                    <telerik:RadDataPagerButtonField FieldType="FirstPrev"></telerik:RadDataPagerButtonField>
                                                                    <telerik:RadDataPagerButtonField FieldType="Numeric" PageButtonCount="4"></telerik:RadDataPagerButtonField>
                                                                    <telerik:RadDataPagerButtonField FieldType="NextLast"></telerik:RadDataPagerButtonField>
                                                                    <telerik:RadDataPagerPageSizeField PageSizeComboWidth="60" PageSizeText="Page size: "></telerik:RadDataPagerPageSizeField>
                                                                    <telerik:RadDataPagerGoToPageField CurrentPageText="Page: " TotalPageText="of" SubmitButtonText="Go"></telerik:RadDataPagerGoToPageField>
                                                                </Fields>
                                                            </telerik:RadDataPager>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="RadListView RadListView_<%# Container.Skin %>">
                                                    <asp:PlaceHolder ID="CustomersContainer" runat="server"></asp:PlaceHolder>
                                                </div>
                                                <div class="clearFix">
                                                </div>
                                                <table class="commandTable">
                                                    <tr>
                                                        <td class="insertCell">
                                                            <asp:Button RenderMode="Lightweight" ID="btnInitInsert" runat="server" Text="Add New Contact" OnClick="btnInitInsert_OnClick" CausesValidation="false"></asp:Button>
                                                        </td>
                                                        <td class="sortCell">
                                                            <asp:Label ID="lblSort1" runat="server" AssociatedControlID="ddListSort" Text="Sort by:"
                                                                CssClass="sortLabel"></asp:Label>
                                                            <telerik:RadComboBox RenderMode="Lightweight" ID="ddListSort" Width="185px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddListSort_OnSelectedIndexChanged" CausesValidation="false">
                                                                <Items>
                                                                    <telerik:RadComboBoxItem Text="-Select field to sort-" Value=""></telerik:RadComboBoxItem>
                                                                    <telerik:RadComboBoxItem Text="First name" Value="CompanyName"></telerik:RadComboBoxItem>
                                                                    <telerik:RadComboBoxItem Text="Last name" Value="ContactName"></telerik:RadComboBoxItem>
                                                                    <telerik:RadComboBoxItem Text="Title" Value="ContactTitle"></telerik:RadComboBoxItem>
                                                                    <telerik:RadComboBoxItem Text="Date of Birth" Value="birthDate"></telerik:RadComboBoxItem>
                                                                </Items>
                                                            </telerik:RadComboBox>
                                                            <asp:RadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" ID="rblSort"
                                                                runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblSort_OnSelectedIndexChanged">
                                                                <asp:ListItem Text="Ascending" Value="ASC" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Descending" Value="DESC"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <!--The widths/heights of the fieldset/outer tables in the item/edit/insert templates should match to avoid wrapping or visual discrepancies
                                    in the tiles layout-->
                                                <fieldset class="fieldset itemFieldset">
                                                    <table class="dataTable">
                                                        <tr class="rlvI">
                                                            <td>
                                                                <table class="itemTable" style="font-family: Segoe UI">
                                                                    <tr>
                                                                        <td>
                                                                            <table class="innerItemTable">
                                                                                <tr>
                                                                                    <td class="itemCellLabel">ID:
                                                                                    </td>
                                                                                    <td class="itemCellInfo">
                                                                                        <%#Eval("ID")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>Title:</td>
                                                                                    <td>
                                                                                        <%#Eval("Title")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>First name:</td>
                                                                                    <td>
                                                                                        <%#Eval("FIRST_NAME")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="white-space: nowrap;">Last Name:</td>
                                                                                    <td>
                                                                                        <%# Eval("LAST_NAME")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="white-space: nowrap;">Date of Birth:</td>
                                                                                    <td>
                                                                                        <%# Eval("BIRTHDATE")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>Mobile:</td>
                                                                                    <td>
                                                                                        <%#Eval("MOBILE")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>Email:</td>
                                                                                    <td>
                                                                                        <%#Eval("EMAIL")%>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td class="image">
                                                                            <img class="img-countries" alt='hello' src='Images/family/emptyPerson.jpg' height="110px" />
                                                                            <%--<telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText="Contact Photo"
                                                                                        ToolTip="Contact Photo" Width="90px" Height="110px" ResizeMode="Fit" DataValue='<%# Eval("Photo") == DBNull.Value? new System.Byte[0]: Eval("Photo") %>'></telerik:RadBinaryImage>--%>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <telerik:RadButton RenderMode="Lightweight" ID="btnEdit" CssClass="btnEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("ID") %>' CausesValidation="false"></telerik:RadButton>
                                                                <telerik:RadButton RenderMode="Lightweight" ID="btnDelete" CssClass="btnDelete" runat="server" Text="Delete" CommandName="Delete" CausesValidation="false"></telerik:RadButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </fieldset>
                                            </ItemTemplate>
                                            <EmptyDataTemplate>
                                                <fieldset class="noRecordsFieldset">
                                                    <legend>Family Members</legend>No records for family members available.
                                                </fieldset>
                                            </EmptyDataTemplate>
                                        </asp:ListView>
                                    </asp:Panel>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-12">
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                        </ContentTemplate>
                    </asp:PanelItem>
                    <telerik:RadPanelItem Text="General Information" Value="GeneralInformation">
                        <HeaderTemplate>
                            <span class="rpText"><a id="generalInformation" name="generalInformation"></a><i class='fa fa-cogs fa-fw'></i> General Information&nbsp;
                                <telerik:RadLabel runat="server" ID="rlGeneralInformation" CssClass="selectionInformation"></telerik:RadLabel>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row rowtop">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Remarks</label>
                                        <asp:TextBox ID="tbRemarks" runat="server" CssClass="form-control" Rows="4" TextMode="MultiLine" placeholder="Enter text"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Extra Origin Info</label>
                                        <asp:TextBox runat="server" ID="tbExtraInfo" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter text" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:CheckBox runat="server" ID="cbDeactivate" CssClass="form-control" Checked="false" Text="&nbsp;&nbsp;Deactivate" />
                                    </div>
                                    <div class="form-group">
                                        <asp:CheckBox runat="server" ID="cbExcludeFromCampaigns" CssClass="form-control" Checked="false" Text="&nbsp;&nbsp;Exclude this contact from campaigns" />
                                    </div>
                                    <div class="form-group">
                                        <asp:CheckBox runat="server" ID="cbExcludeFromSMS" CssClass="form-control" Checked="false" Text="&nbsp;&nbsp;Exclude from SMS" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:CheckBox runat="server" ID="cbExcludeFromPhoneCalls" CssClass="form-control" Checked="false" Text="&nbsp;&nbsp;Exclude from telephone calls" />
                                    </div>
                                    <div class="form-group">
                                        <asp:CheckBox runat="server" ID="cbCreateFollowUp" CssClass="form-control" Checked="true" Text="&nbsp;&nbsp;Create follow-up reminders for this contact" />
                                    </div>
                                    <div class="form-group">
                                        <asp:CheckBox runat="server" ID="CheckBox2" CssClass="form-control" Checked="false" Text="&nbsp;&nbsp;Enixie" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem Text="Physical Address" Value="PhysicalAddress">
                        <HeaderTemplate>
                            <span class="rpText"><a id="physicalAddress" name="physicalAddress"></a><i class='fa fa-home fa-fw'></i> Physical Address&nbsp;
                                <telerik:RadLabel runat="server" ID="rlPhysicalAddress" CssClass="selectionInformation"></telerik:RadLabel>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row firstRow">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <a name="Physical_Address" id="Physical_Address"></a>
                                        <label class="control-label">Line 1</label>
                                        <asp:TextBox runat="server" ID="tbAddressLine1" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Line 2</label>
                                        <asp:TextBox runat="server" ID="tbAddressLine2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Suburb</label>
                                        <div class="input-group custom-search-form">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbSuburb" placeholder="Enter text" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbPhysicalSuburbSearch" OnClick="lbPhysicalSuburbSearch_OnClick">
                                                    <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Code</label>
                                        <div class="input-group custom-search-form">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbCode" placeholder="Enter numbers only" type="number" MaxLength="4" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbPhysicalCodeSearch" OnClick="lbPhysicalCodeSearch_OnClick">
                                                    <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">City</label>
                                        <asp:TextBox runat="server" ID="tbCity" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Province</label>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlProvinces" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Country</label>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCountry" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem Text="Postal Address" Value="PostalAddress">
                        <HeaderTemplate>
                            <span class="rpText"><a id="postalAddress" name="postalAddress"></a><i class='fa fa-envelope fa-fw'></i> Postal Address&nbsp;
                                <telerik:RadLabel runat="server" ID="rlPostalAddress" CssClass="selectionInformation"></telerik:RadLabel>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row firstRow">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <a name="Postal_Address" id="Postal_Address"></a>
                                        <label class="control-label"></label>
                                        <asp:CheckBox runat="server" ID="cbSameAsPhysical" CssClass="form-control" Checked="false" Text="&nbsp;&nbsp;Same as Physical Address" AutoPostBack="True" OnCheckedChanged="cbSameAsPhysical_OnCheckedChanged" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Address Type</label>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlAddressType" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Line 1</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbPostalLine1" placeholder="Enter text" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Line 2</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbPostalLine2" placeholder="Enter text" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Suburb</label>
                                        <div class="input-group custom-search-form">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbPostalSuburb" placeholder="Enter text" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbPostalSuburbSearch" OnClick="lbPostalSuburbSearch_OnClick">
                                                    <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Code</label>
                                        <div class="input-group custom-search-form">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbPostalCode" placeholder="Enter numbers only" type="number" MaxLength="4" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbPostalCodeSearch" OnClick="lbPostalCodeSearch_OnClick">
                                                    <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem Text="Employer Information" Value="EmployerInformation">
                        <HeaderTemplate>
                            <span class="rpText"><a name="employerInformation" id="employerInformation"></a><i class='fa fa-industry-alt fa-fw'></i> Employer Information&nbsp;
                                <telerik:RadLabel runat="server" ID="rlEmployerInformation" CssClass="selectionInformation"></telerik:RadLabel>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row firstRow">
                                <div class="col-lg-6">
                                    <a name="Employer Information" id="Employer_Information"></a>
                                    <div class="form-group">
                                        <label class="control-label">Position</label>
                                        <asp:DropDownList runat="server" ID="ddlPosition" CssClass="form-control" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Employer</label>
                                        <asp:HiddenField runat="server" ID="hfCompanyNo" />
                                        <asp:HiddenField runat="server" ID="hfCompanyId" />
                                        <div class="input-group custom-search-form">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbEmployer" placeholder="Click Search" ReadOnly="True" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbEmployerSearch" OnClick="lbEmployerSearch_OnClick">
                                                    <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <hr />
                                    <h5>Company Address</h5>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">&nbsp;</label>
                                        <asp:CheckBox runat="server" ID="cbSameAsCompanyAddress" AutoPostBack="True" CssClass="form-control" OnCheckedChanged="cbSameAsCompanyAddress_OnCheckedChanged" Text="&nbsp;Same as Company Address" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row" style="padding-top: 10px;">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Line 1</label>
                                        <asp:TextBox runat="server" ID="tbBusinessAddress1" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Line 2</label>
                                        <asp:TextBox runat="server" ID="tbBusinessAddress2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Suburb</label>
                                        <div class="input-group custom-search-form">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbBusinessSuburb" placeholder="Enter text" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbBusinessSuburb" OnClick="lbBusinessSuburb_OnClick">
                                                    <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Code</label>
                                        <div class="input-group custom-search-form">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbBusinessCode" placeholder="Enter numbers only" type="number" MaxLength="4" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbBusinessCodeSearch" OnClick="lbBusinessCodeSearch_OnClick">
                                                    <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">City</label>
                                        <asp:TextBox runat="server" ID="tbBusinessCity" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Province</label>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlBusinessProvince" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Country</label>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlBusinessCountry" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem Text="Current Vehicle" Value="CurrentVehicle">
                        <HeaderTemplate>
                            <span class="rpText"><a name="currentVehicle" id="currentVehicle"></a><i class='fa fa-car-garage fa-fw'></i> Current Vehicle&nbsp;
                                <telerik:RadLabel runat="server" ID="rlCurrentVehicle" CssClass="selectionInformation"></telerik:RadLabel>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row firstRow">
                                <div class="col-lg-6">
                                    <a name="Current Vehicle" id="Current_Vehicle"></a>
                                    <div class="form-group">
                                        <label class="control-label">Brand</label>
                                        <asp:DropDownList runat="server" ID="ddlBrand" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlBrand_OnSelectedIndexChanged" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Model</label>
                                        <asp:DropDownList runat="server" ID="ddlModel" class="form-control" DataTextField="Name" DataValueField="Code" AutoPostBack="True" OnSelectedIndexChanged="ddlModel_OnSelectedIndexChanged" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Model Year</label>
                                        <asp:DropDownList runat="server" ID="ddlModelYear" class="form-control" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">How is this vehicle financed?</label>
                                        <asp:DropDownList runat="server" ID="ddlHowFinanced" CssClass="form-control" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Comments</label>
                                        <asp:TextBox ID="tbExistingVehicleComments" runat="server" CssClass="form-control" Rows="4" TextMode="MultiLine" placeholder="Enter text"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Owned a VW, Audi</label>
                                        <asp:RadioButtonList runat="server" ID="rblOwnedAVW" CssClass="form-control" RepeatDirection="Horizontal">
                                            <Items>
                                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="No" Text="No" Selected="True" />
                                            </Items>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">History with the brand</label>
                                        <asp:TextBox ID="tbHistoryWithTheBrand" runat="server" CssClass="form-control" Rows="4" TextMode="MultiLine" placeholder="Enter text"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <asp:item Text="Desired Vehicle" Value="DesiredVehicle">
                        <HeaderTemplate>
                            <span class="rpText"><a name="desiredVehicle" id="desiredVehicle"></a><i class='fas fa-car-garage fa-fw'></i> Desired Vehicle&nbsp;
                                <telerik:RadLabel runat="server" ID="rlDesiredVehicle" CssClass="selectionInformation"></telerik:RadLabel>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row firstRow">
                                <div class="col-lg-6">
                                    <a name="Desired_Vehicle" id="Desired_Vehicle"></a>
                                    <div class="form-group">
                                        <label class="control-label">Core Reason for Visit</label>
                                        <asp:DropDownList runat="server" ID="ddlCoreReasonForVisit" CssClass="form-control" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Primary Driver</label>
                                        <asp:DropDownList runat="server" ID="ddlPrimaryDriver" CssClass="form-control" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row firstRow">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Brand</label>
                                        <asp:DropDownList runat="server" ID="ddlDesiredBrand" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDesiredBrand_OnSelectedIndexChanged" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Model</label>
                                        <asp:DropDownList runat="server" ID="ddlDesiredModel" class="form-control" DataTextField="Name" DataValueField="Code" AutoPostBack="True" OnSelectedIndexChanged="ddlDesiredModel_OnSelectedIndexChanged" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Model Year</label>
                                        <asp:DropDownList runat="server" ID="ddlDesiredModelYear" class="form-control" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Comments</label>
                                        <asp:TextBox ID="tbDesiredComments" runat="server" CssClass="form-control" Rows="4" TextMode="MultiLine" placeholder="Enter text"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>Vehicle Use</h4>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Primary Vehicle Use</label>
                                        <asp:DropDownList runat="server" ID="ddlPrimaryVehicleUse" CssClass="form-control" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Preferred Colour 1</label>
                                        <asp:TextBox runat="server" ID="tbPreferredColour1" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Preferred Colour 2</label>
                                        <asp:TextBox runat="server" ID="tbPreferredColour2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Preferred Colour 3</label>
                                        <asp:TextBox runat="server" ID="tbPreferredColour3" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Number of Passengers</label>
                                        <asp:TextBox runat="server" ID="tbNumberOfPassengers" type="number" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Luggage Space Priority</label>
                                        <asp:DropDownList runat="server" ID="ddlLuggageSpacePriority" CssClass="form-control" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Number of Doors</label>
                                        <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="rblNumberOfDoors" CssClass="form-control">
                                            <Items>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="No Preference" Value="No Preference" Selected="True"></asp:ListItem>
                                            </Items>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Estimated Monthly Repayment</label>
                                        <telerik:RadNumericTextBox CssClass="form-control" placeholder="R0,00" Style="text-align: right" ID="tbEstimatedMonthlyRepayment" runat="server" Type="Currency" Culture="en-ZA" Width="100%"></telerik:RadNumericTextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Preferred Vehicle Type</label>
                                        <asp:DropDownList runat="server" ID="ddlPreferredVehicleType" CssClass="form-control" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Average Annual Mileage</label>
                                        <asp:TextBox runat="server" ID="tbAverageAnnualMileage" CssClass="form-control" type="number"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Off-Road Use</label>
                                        <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="rblOffRoadUse" CssClass="form-control">
                                            <Items>
                                                <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="N" Selected="True"></asp:ListItem>
                                            </Items>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Fuel Preference</label>
                                        <asp:DropDownList runat="server" ID="ddlFuelPreference" CssClass="form-control" DataTextField="description" DataValueField="code" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Intended Date of Purchase</label>
                                        <telerik:RadDatePicker ID="rdpIntendedDateOfPurchase" runat="server" Width="100%" SkipMinMaxDateValidationOnServer="True" MinDate="1900/01/01">
                                            <DateInput runat="server" ReadOnly="True"></DateInput>
                                        </telerik:RadDatePicker>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Desired Delivery Date</label>
                                        <telerik:RadDatePicker ID="rdpDesiredDeliveryDate" runat="server" Width="100%" SkipMinMaxDateValidationOnServer="True" MinDate="1900/01/01">
                                            <DateInput runat="server" ReadOnly="True"></DateInput>
                                        </telerik:RadDatePicker>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>Vehicle Requirements</h4>
                                    <hr />
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Emotional Reason for Purchase</label><br />
                                        <telerik:RadListBox RenderMode="Lightweight" runat="server" ID="rlbEmotionalReasonSource" Height="200px" Width="230px"
                                            AllowTransfer="true" TransferToID="rlbEmotionalReasonDestination" SelectionMode="Multiple"
                                            ButtonSettings-AreaWidth="35px" DataTextField="description" DataValueField="id" />
                                        <telerik:RadListBox RenderMode="Lightweight" runat="server" ID="rlbEmotionalReasonDestination" Height="200px" Width="230px"
                                            ButtonSettings-AreaWidth="35px" DataTextField="description" DataValueField="id">
                                        </telerik:RadListBox>

                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label"></label>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Functional Requirements</label><br />
                                        <telerik:RadListBox RenderMode="Lightweight" runat="server" ID="rlbFunctionalRequirementsSource" Height="200px" Width="230px"
                                            AllowTransfer="true" TransferToID="rlbFunctionalRequirementsDestination" SelectionMode="Multiple"
                                            ButtonSettings-AreaWidth="35px" DataTextField="description" DataValueField="id">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox RenderMode="Lightweight" runat="server" ID="rlbFunctionalRequirementsDestination" Height="200px" Width="230px"
                                            ButtonSettings-AreaWidth="35px" DataTextField="description" DataValueField="id">
                                            <FooterTemplate>
                                                <asp:TextBox RenderMode="Lightweight" runat="server" ID="tbFunctionRequirement" EmptyMessage="Functional Requirement" Skin="Telerik" Style="width: 160px !important;" />
                                                <telerik:RadButton RenderMode="Lightweight" runat="server" ID="AddFunctionalRequirementButton" Text="" CssClass="add-button"
                                                    OnClick="AddFunctionalRequirementButton_OnClick" ButtonType="SkinnedButton" Skin="Telerik" Style="background: url( 'images/icon-add.gif' ) center center no-repeat; width: 35px !important; height: 35px !important;" />
                                                <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" Display="None"
                                                                        ControlToValidate="TitleTextBox" ErrorMessage="Title is required" />--%>
                                            </FooterTemplate>
                                        </telerik:RadListBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Required Accessories</label><br />
                                        <telerik:RadListBox RenderMode="Lightweight" runat="server" ID="rlbRequiredAccessoriesSource" Height="200px" Width="230px"
                                            AllowTransfer="true" TransferToID="rlbRequiredAccessoriesDestination" SelectionMode="Multiple"
                                            ButtonSettings-AreaWidth="35px" DataTextField="description" DataValueField="id">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox RenderMode="Lightweight" runat="server" ID="rlbRequiredAccessoriesDestination" Height="200px" Width="230px"
                                            ButtonSettings-AreaWidth="35px" DataTextField="description" DataValueField="id">
                                            <FooterTemplate>
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="tbRequiredAccessory" EmptyMessage="Required accessory" Skin="Telerik" Style="width: 160px !important;" />
                                                <telerik:RadButton RenderMode="Lightweight" runat="server" ID="btnAddRequiredAccessory" Text="" CssClass="add-button"
                                                    OnClick="btnAddRequiredAccessory_OnClick" ButtonType="SkinnedButton" Skin="Telerik" Style="background: url( 'images/icon-add.gif' ) center center no-repeat; width: 35px !important; height: 35px !important;" />
                                                <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" Display="None"
                                                                        ControlToValidate="TitleTextBox" ErrorMessage="Title is required" />--%>
                                            </FooterTemplate>
                                        </telerik:RadListBox>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                           
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label"></label>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label"></label>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->
                        </ContentTemplate>
                    </asp:item>
                </Items>
            </asp:Panel>
            <!-- /telerik:RadPanelBar -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</asp:Content>
