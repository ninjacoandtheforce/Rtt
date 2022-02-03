<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAContact.aspx.cs" Inherits="Rtt.Web.AddAContact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="row contentRow">
        <div class="col-lg-12">
        <a name="topOfPanel" id="topOfPanel"></a> 
            <asp:Panel runat="server" ID="RadPanelBar1" Width="100%" ExpandMode="SingleExpandedItem" Skin="Bootstrap"  onclientitemclicked="OnClientItemClicked">
                <Items>
                    <asp:Panel Expanded="True" Text="Contact Information" Value="ContactInformation">
                        <HeaderTemplate>
                            <span class="rpText"><a id="contactInformation" name="contactInformation"></a><i class='fa fa-address-card fa-fw'></i> Contact Information&nbsp;
                                <asp:Label runat="server" ID="rlContactInformation" CssClass="selectionInformation"></asp:Label>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-12">&nbsp;</div>
                            </div>
                        <div class="row" style="margin-top:-40px" runat="server" id="divIdVerification">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    
                                    <label class="control-label"></label>
                                </div>
                            </div>
                            <!-- /.col-lg-6 -->
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="control-label">Scan and Upload License Card</label>
                                    <div id="thumbnail" ></div>
                                    <span style="font-size: x-small; color: green">ID Verification result:&nbsp;<asp:Label runat="server" ID="lblVerificationResult"></asp:Label></span>
                                </div>
                            </div>
                            <!-- /.col-lg-4 -->
                            <div class="col-lg-2">
                                <asp:Button runat="server" ID="btnUpload" Text="Upload" CssClass="btn btn-primary" style="float: right; margin-top: -40px; visibility: hidden" />
                                <asp:Image ID="Image1" runat="server" Height="20px" Style="visibility: hidden" Width="20px" />
                            </div>
                        </div>
                        <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group" id="rightParent">
                                        <label class="control-label">ID Type</label>
                                        <asp:DropDownList runat="server" ID="ddlIdType" CssClass="form-control" DataTextField="DESCRIPTION" DataValueField="CODE" AutoPostBack="true" />
                                    </div>
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="form-group" id="rightParent2">
                                        <label class="control-label" runat="server" id="lblIdNumber">ID Number</label>
                                        <div class="input-group custom-search-form" id="input2">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="tbIdNumber" placeholder="Enter text" MaxLength="20" data-error="This is not a valid SA ID Number" AutoPostBack="True"  />
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbIdLookup">
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
                                        <asp:DropDownList runat="server" ID="ddlTitle" class="form-control" DataTextField="Abbreviation" DataValueField="IdTitle" required="true"  AutoPostBack="False" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
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
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbFirstName" placeholder="Enter text" required="true" AutoPostBack="False"  Style="text-transform: capitalize" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <!-- /.col-lg-3 -->

                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group required" id="vgLastname" runat="server">
                                        <a name="bmLastName"></a>
                                        <label class="control-label">Last Name</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbSurname" placeholder="Enter text" required="true" Style="text-transform: capitalize" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group required" id="vgEmail" runat="server">
                                        <a name="bmEmail"></a>
                                        <label class="control-label">Email</label>
                                        <div class="input-group" id="emailGroup">
                                            <asp:HyperLink runat="server" ID="hlEmail" CssClass="input-group-addon" Text="<span class='glyphicon glyphicon-envelope' aria-hidden='true'>"></asp:HyperLink>
                                            <asp:TextBox CssClass="form-control" placeholder="Enter text" ID="tbEmail" runat="server" AutoPostBack="True" required="true" type="email" data-error="This is not a valid Email Address" />
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
                                            <asp:TextBox CssClass="form-control" ID="tbMobile" runat="server" RenderMode="Lightweight" Mask="(###)###-####" type="number" data-error="At least one contact number is required"></asp:TextBox>
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
                                            <asp:TextBox CssClass="form-control" ID="tbHomeTel" runat="server" RenderMode="Lightweight" Height="34px" Mask="(###)###-####" ></asp:TextBox>
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
                                                <asp:TextBox CssClass="form-control" ID="tbWorkTel" runat="server" RenderMode="Lightweight" Mask="(###)###-####"></asp:TextBox>
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
                                        </asp:Calendar>
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
                        </ContentTemplate>
                    </asp:Panel>
                <asp:Panel Text="Physical Address" Value="PhysicalAddress">
                        <HeaderTemplate>
                            <span class="rpText"><a id="physicalAddress" name="physicalAddress"></a><i class='fa fa-home fa-fw'></i> Physical Address&nbsp;
                                <asp:Label runat="server" ID="rlPhysicalAddress" CssClass="selectionInformation"></asp:Label>
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
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbPhysicalSuburbSearch" >
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
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbPhysicalCodeSearch" >
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
                    </asp:Panel>
                    <asp:Panel Text="Postal Address" Value="PostalAddress">
                        <HeaderTemplate>
                            <span class="rpText"><a id="postalAddress" name="postalAddress"></a><i class='fa fa-envelope fa-fw'></i> Postal Address&nbsp;
                                <asp:Label runat="server" ID="rlPostalAddress" CssClass="selectionInformation"></asp:Label>
                            </span>
                            <span style="float: right; margin-top: -30px"><span class="p-icon p-i-arrow-chevron-down" style="color: white; cursor: pointer"></span></span>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row firstRow">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <a name="Postal_Address" id="Postal_Address"></a>
                                        <label class="control-label"></label>
                                        <asp:CheckBox runat="server" ID="cbSameAsPhysical" CssClass="form-control" Checked="false" Text="&nbsp;&nbsp;Same as Physical Address" />
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
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbPostalSuburbSearch" >
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
                                                <asp:LinkButton class="btn btn-default" type="button" runat="server" ID="lbPostalCodeSearch" >
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
                    </asp:Panel>
                </Items>
            </asp:Panel>
            <!-- /asp:Panel -->
        </div>
<div class="row">
    <div class="col-lg-4">
        <asp:LinkButton runat="server" ID="lbSaveContact" OnClick="lbSaveContact_OnClick" CssClass="btn btn-support5 btn-block" Text="<span class='glyphicon glyphicon-floppy-disk' aria-hidden='true'></span> Save Contact" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)" />
        <%--<asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary btn-block" Text="Save Contact" data-toggle="tooltip" data-placement="top" title="Save this contact" OnClick="btSubmit_OnClick"  />--%>
    </div>
    <div class="col-lg-4">
        <asp:LinkButton runat="server" ID="lbSaveAndClose" CssClass="btn btn-support5 btn-block" Text="<span class='glyphicon glyphicon-floppy-disk' aria-hidden='true'></span> Save and Close" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)" />
        <%--<asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary btn-block" Text="Save Contact" data-toggle="tooltip" data-placement="top" title="Save this contact" OnClick="btSubmit_OnClick"  />--%>
    </div>
    <div class="col-lg-4">
        <asp:LinkButton runat="server" ID="lbCancel" CssClass="btn btn-warning btn-block" Text="<span class='glyphicon glyphicon-remove-sign' aria-hidden='true'></span> Cancel" OnClick="lbCancel_OnClick" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)" />
    </div>
</div>
<!-- /.row -->
        <!-- /.col-lg-12 -->
    </div>
</asp:Content>
