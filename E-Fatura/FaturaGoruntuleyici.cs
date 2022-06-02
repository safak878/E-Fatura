using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;

namespace E_Fatura
{
    public partial class FaturaGoruntuleyici : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public FaturaGoruntuleyici(string documentText)
        {
            InitializeComponent();
            webBrowser1.DocumentText = documentText;
        }

        private void btnYazdir_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            webBrowser1.ShowPrintDialog();
        }

        private void btnBaskiOnizleme_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            webBrowser1.ShowPrintPreviewDialog();
        }
    }
}