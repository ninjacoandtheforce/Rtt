using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rtt.Models;
using Rtt.Web.Enums;
using Rtt.Web.Extensions;
using Rtt.Web.Services;

namespace Rtt.Web
{
    public partial class AddAContact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Error(object sender, EventArgs e)
        {
            var ex = Server.GetLastError();
            this.HandleException(ex, false);
        }

        private bool SaveContact()
        {
            //-->[Validation]
            //if (!ValidateForm()) return false;

            var contact = new ContactDto(); //: ContactServices.GetById(contactId);
            //if (contact == null)
            //{
            //    ShowError(
            //        $@"An error has occurred while retrieving a contact for id {
            //                Request.QueryString["id"].ToInt()
            //            }. Updating this contact is " +
            //        "not possible at this time.");
            //    return false;
            //}

            contact.CITY = tbCity.Text;
            contact.COUNTRY = ddlCountry?.SelectedIndex != 0 ? ddlCountry?.SelectedItem.Text : null;
            contact.EMAIL = tbEmail.Text.Trim();
            contact.LAST_NAME = tbSurname.Text.Trim();
            contact.MOBILE = tbMobile.Text;
            contact.POSTAL_ADDRESS_1 = tbPostalLine1.Text;
            contact.POSTAL_ADDRESS_2 = tbPostalLine2.Text;
            contact.POSTAL_CODE = tbPostalCode.Text;
            contact.POSTAL_SUBURB = tbPostalSuburb.Text;
            contact.STATE = ddlProvinces.SelectedIndex != 0 ? ddlProvinces.SelectedItem.Text : null;
            contact.STREET_ADDRESS_1 = tbAddressLine1.Text;
            contact.STREET_ADDRESS_2 = tbAddressLine2.Text;
            contact.STREET_CODE = tbCode.Text;
            contact.SUBURB = tbSuburb.Text;
            contact.TELH = !string.IsNullOrWhiteSpace(tbHomeTel.Text) && tbHomeTel.Text.Length >= 10
                ? tbHomeTel.Text.Substring(3, 7)
                : "";
            contact.TELW = !string.IsNullOrWhiteSpace(tbWorkTel.Text) && tbWorkTel.Text.Length >= 10
                ? tbWorkTel.Text.Substring(3, 7)
                : "";
            contact.TITLE = ddlTitle.SelectedItem != null ? ddlTitle.SelectedItem.Text?.Trim() : "";

            contact = ContactServices.CreateOrUpdate(contact);

            if (contact != null)
            {
                if (Request.QueryString?["returnUrl"] != null)
                {
                    var returntext =
                        $@"Do you want to return to the <a href=""{
                                Request.QueryString["ReturnUrl"]
                            }"">previous page </a>";
                    ShowSuccess($@"Contact {contact.ID} has been successfully saved. {returntext}");
                    return true;
                }

                ShowSuccess($@"Contact {contact.ID} has been saved successfully");

            }
            else
            {
                ShowError("An error was encountered saving the contact.");
                return false;
            }

            return true;
        }

        private void ShowSuccess(string successMessage)
        {
            this.ShowToast(ToastTypeEnum.Success, successMessage, "Success");
        }

        private void ShowError(string errorMessage)
        {
            this.ShowToast(ToastTypeEnum.Error, errorMessage, "An error has occurred");
        }

        private void ShowWarning(string warningMessage)
        {
            this.ShowToast(ToastTypeEnum.Warning, warningMessage, "Warning");
        }

        protected void lbSaveContact_OnClick(object sender, EventArgs e)
        {
            SaveContact();
        }
    }
}