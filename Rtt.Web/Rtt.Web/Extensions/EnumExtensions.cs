using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using Rtt.Web.Attributes;

namespace Rtt.Web.Extensions
{
    public static class EnumExtensions
    {
        //refer to string extensions for the inverse
        [Help(@"string description = someColor.Description();")]
        public static string Description(this Enum someEnum)
        {
            var memInfo = someEnum.GetType().GetMember(someEnum.ToString());

            if (memInfo != null && memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof(DescriptionAttribute), false);

                if (attrs != null && attrs.Length > 0)
                    return ((DescriptionAttribute)attrs[0]).Description;
            }
            return someEnum.ToString();
        }

        [Help(@"if (someColor.HasDescription())")]
        public static bool HasDescription(this Enum someEnum)
        {
            return !string.IsNullOrWhiteSpace(Description(someEnum));
        }
        public static bool HasDescription(this Enum someEnum, string expectedDescription)
        {
            return Description(someEnum).Equals(expectedDescription);
        }

        [Help(@"if (someColor.HasDescription(""indicates stop"", StringComparison.OrdinalIgnoreCase))")]
        public static bool HasDescription(this Enum someEnum, string expectedDescription, StringComparison comparisionType)
        {
            return Description(someEnum).Equals(expectedDescription, comparisionType);
        }

        [Help(@"var panda = EnumExtensions.GetValueFromDescription<Animal>(""Giant Panda"");")]
        public static T GetValueFromDescription<T>(string description)
        {
            var type = typeof(T);
            if (!type.IsEnum) throw new InvalidOperationException();
            foreach (var field in type.GetFields())
            {
                var attribute = Attribute.GetCustomAttribute(field,
                    typeof(DescriptionAttribute)) as DescriptionAttribute;
                if (attribute != null)
                {
                    if (attribute.Description == description)
                        return (T)field.GetValue(null);
                }
                else
                {
                    if (field.Name == description)
                        return (T)field.GetValue(null);
                }
            }
            throw new ArgumentException("Not found.", "Description");
            // or return default(T);
        }


        #region ShortDescription

        [Help(@"string shortDescription = someColor.ShortDescription();")]
        public static string ShortDescription(this Enum someEnum)
        {
            var memInfo = someEnum.GetType().GetMember(someEnum.ToString());

            if (memInfo != null && memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof(ShortDescriptionAttribute), false);

                if (attrs != null && attrs.Length > 0)
                    return ((ShortDescriptionAttribute)attrs[0]).ShortDescription;
            }
            return someEnum.ToString();
        }

        #endregion

        #region XslName

        [Help(@"string xslName = someColor.XslName();")]
        public static string XslName(this Enum someEnum)
        {
            var memInfo = someEnum.GetType().GetMember(someEnum.ToString());

            if (memInfo != null && memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof(XslNameAttribute), false);

                if (attrs != null && attrs.Length > 0)
                    return ((XslNameAttribute)attrs[0]).XslName;
            }
            return someEnum.ToString();
        }

        #endregion

        [Help(@"string FriendlyErrorMessage = someColor.FriendlyErrorMessage();")]
        public static string FriendlyErrorMessage(this Enum someEnum)
        {
            var memInfo = someEnum.GetType().GetMember(someEnum.ToString());

            if (memInfo != null && memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof(FriendlyErrorMessageAttribute), false);

                if (attrs != null && attrs.Length > 0)
                    return ((FriendlyErrorMessageAttribute)attrs[0]).FriendlyErrorMessage;
            }
            return someEnum.ToString();
        }

        public static TAttribute GetAttribute<TAttribute>(this Enum value)
            where TAttribute : Attribute
        {
            var type = value.GetType();
            var name = Enum.GetName(type, value);
            return type.GetField(name)
                .GetCustomAttributes(false)
                .OfType<TAttribute>()
                .SingleOrDefault();
        }


        public static List<string> GetDescriptionValuesOf<TEnum>()
            where TEnum : struct // can't constrain to enums so closest thing
        {
            return Enum.GetValues(typeof(TEnum)).Cast<Enum>()
                .Select(val => GetAttribute<DescriptionAttribute>(val).Description)
                .ToList();
        }


    }
}