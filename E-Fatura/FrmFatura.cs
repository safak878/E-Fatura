using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Serialization;
using System.Xml.Xsl;
using DevExpress.XtraEditors;
using DevExpress.XtraPrinting.Native;
using DevExpress.Utils.Extensions;

namespace E_Fatura
{
    public partial class FrmFatura : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public FrmFatura()
        {
            InitializeComponent();
            DataSource();
            Toplamlar();
        }

        private void DataSource()
        {
            //txtFaturaNo.Text = "EAR2019000000001";
            //txtCariKodu.Text = "120 10 01 002";
            //txtCariAdi.Text = "Burak Küsmez";
            //txtTarih.EditValue = DateTime.Now;
            //txtSube.Text = "001 - Merkez Şube";

        


            faturaTablo.DataSource = new BindingList<FaturaHareket>
            {
                new FaturaHareket
                {
                    StokKodu = "Stok-0001",
                    StokAdi = "Mouse",
                    Birim = "Adet",
                    Miktar = 12,
                    KdvOrani = 18,
                    Fiyat = 55,
                    Tutar = 660,
                    Iskonto = 66,
                    IskontoOrani = 10,
                    NetTutar = 594,
                    Kdv = (decimal) 106.92,
                    ToplamTutar = (decimal) 700.92,
                },
                new FaturaHareket
                {
                    StokKodu = "Stok-0002",
                    StokAdi = "Klavye",
                    Birim = "Adet",
                    Miktar = 7,
                    KdvOrani = 18,
                    Fiyat = 110,
                    Tutar = 770,
                    Iskonto = (decimal)38.5,
                    IskontoOrani = 5,
                    NetTutar = (decimal)731.5,
                    Kdv = (decimal) 131.67,
                    ToplamTutar = (decimal) 863.17,
                },
                new FaturaHareket
                {
                    StokKodu = "Stok-0003",
                    StokAdi = "Monitör",
                    Birim = "Adet",
                    Miktar = 9,
                    KdvOrani = 18,
                    Fiyat = 1250,
                    Tutar = 11250,
                    Iskonto = (decimal)337.5,
                    IskontoOrani = 3,
                    NetTutar = (decimal)10912.50,
                    Kdv = (decimal) 1964.25,
                    ToplamTutar = (decimal) 12876.75,
                }
            };
        }

        private void Toplamlar()
        {
            txtTutar.Value = faturaGrid.DataController.ListSource.Cast<FaturaHareket>().Sum(x => x.Tutar);
            txtIskontoTutar.Value = faturaGrid.DataController.ListSource.Cast<FaturaHareket>().Sum(x => x.Iskonto);
            txtNetTutar.Value = faturaGrid.DataController.ListSource.Cast<FaturaHareket>().Sum(x => x.NetTutar);
            txtKdvTutar.Value = faturaGrid.DataController.ListSource.Cast<FaturaHareket>().Sum(x => x.Kdv);
            txtToplamTutar.Value = txtNetTutar.Value + txtKdvTutar.Value;
        }

        private void FaturaOlustur(Fatura faturaBilgileri)
        {
            InvoiceLineType[] FaturaHareketleri()
            {
                var lines = new List<InvoiceLineType>();
                var source = faturaGrid.DataController.ListSource.Cast<FaturaHareket>();
                var lineNumber = 1;

                source.ForEach(x =>
                {
                    var line = new InvoiceLineType
                    {
                        ID = new IDType { Value = lineNumber.ToString() },
                        Note = new[] { new NoteType { Value = x.StokKodu + " - " + x.StokAdi } },
                        InvoicedQuantity = new InvoicedQuantityType { unitCode = "C62", Value = x.Miktar },
                        LineExtensionAmount = new LineExtensionAmountType { currencyID = "TRY", Value = x.NetTutar },
                        AllowanceCharge = new[]{new AllowanceChargeType
                        {
                            ChargeIndicator = new ChargeIndicatorType{ Value = false },
                            MultiplierFactorNumeric = new MultiplierFactorNumericType{ Value = x.IskontoOrani/100 },
                            Amount = new AmountType2{ currencyID = "TRY", Value = x.Iskonto },
                            BaseAmount = new BaseAmountType{ currencyID = "TRY", Value = x.Tutar },
                        }},
                        TaxTotal = new TaxTotalType
                        {
                            TaxAmount = new TaxAmountType { currencyID = "TRY", Value = x.Kdv },
                            TaxSubtotal = new[]
                            {
                                new TaxSubtotalType
                                {
                                    TaxableAmount = new TaxableAmountType{ currencyID = "TRY", Value = x.NetTutar },
                                    TaxAmount = new TaxAmountType{ currencyID = "TRY", Value = x.Kdv },
                                    CalculationSequenceNumeric = new CalculationSequenceNumericType{ Value = 1 },
                                    Percent = new PercentType1{ Value = x.KdvOrani },
                                    TaxCategory = new TaxCategoryType
                                    {
                                        TaxScheme = new TaxSchemeType
                                        {
                                            TaxTypeCode = new TaxTypeCodeType{ Value = "0015", name = "KDV" },
                                            Name = new NameType1{ Value = "KDV" }
                                        },
                                    }
                                }
                            }
                        },
                        Item = new ItemType { Name = new NameType1 { Value = x.StokKodu + " - " + x.StokAdi } },
                        Price = new PriceType { PriceAmount = new PriceAmountType { currencyID = "TRY", Value = x.Fiyat } }
                    };

                    lineNumber++;
                    lines.Add(line);
                });

                return lines.ToArray();
            }

            var invoice = new InvoiceType
            {
                UBLVersionID = new UBLVersionIDType { Value = "2.1" },
                CustomizationID = new CustomizationIDType { Value = "TR1.2" },
                ProfileID = new ProfileIDType { Value = "EARSIVFATURA" },
                ID = new IDType { Value = faturaBilgileri.FaturaNo },
                CopyIndicator = new CopyIndicatorType { Value = false },
                UUID = new UUIDType { Value = Guid.NewGuid().ToString() },
                IssueDate = new IssueDateType { Value = faturaBilgileri.Tarih },
                IssueTime = new IssueTimeType { Value = faturaBilgileri.Tarih },
                InvoiceTypeCode = new InvoiceTypeCodeType { Value = "SATIS" },
                Note = new[] { new NoteType { Value = faturaBilgileri.ToplamTutar.YaziIleTutar() },
                                   new NoteType { Value = "İş bu fatura muhteviyatına 7 gün içerisinde itiraz edilmediği taktirde aynen kabul edilmiş sayılır." },
                                   new NoteType { Value = faturaBilgileri.CariKodu + " " + faturaBilgileri.CariAdi }
                    },
                DocumentCurrencyCode = new DocumentCurrencyCodeType { Value = "TRY" },
                LineCountNumeric = new LineCountNumericType { Value = 3 },
                AdditionalDocumentReference = new[]{new DocumentReferenceType
                    {
                        ID = new IDType{Value = Guid.NewGuid().ToString()},
                        IssueDate = new IssueDateType{Value = faturaBilgileri.Tarih},
                        DocumentType = new DocumentTypeType{Value = "XSLT"},
                        Attachment =new AttachmentType
                        {
                            EmbeddedDocumentBinaryObject = new EmbeddedDocumentBinaryObjectType
                            {
                                characterSetCode = "UTF-8",
                                encodingCode = "Base64",
                                filename = "EArchiveInvoice.xslt",
                                mimeCode = "application/xml",
                                Value = Encoding.UTF8.GetBytes(new StreamReader(new FileStream(Application.StartupPath+"\\"+"general.xslt",FileMode.Open,FileAccess.Read),Encoding.UTF8).ReadToEnd())
                            }
                        }
                    },
                        new DocumentReferenceType
                        {
                            ID =new IDType{Value = Guid.NewGuid().ToString()},
                            IssueDate = new IssueDateType{Value = faturaBilgileri.Tarih},
                            DocumentTypeCode = new DocumentTypeCodeType{Value = "SendingType"},
                            DocumentType = new DocumentTypeType{Value = "ELEKTRONIK"}
                        },
                    },
                Signature = new[]
                    {
                        new SignatureType
                        {
                            ID = new IDType{schemeID = "VKN_TCKN",Value = "1234567890"},
                            SignatoryParty = new PartyType
                            {
                                PartyIdentification = new []{ new PartyIdentificationType { ID = new IDType{ schemeID = "VKN", Value = "1234567890" } } },
                                PostalAddress = new AddressType
                                {
                                    Room = new RoomType{Value = "5"},
                                    BlockName = new BlockNameType{Value = "A Blok"},
                                    BuildingName = new BuildingNameType{Value = "Burhaniye Mahallesi"},
                                    BuildingNumber = new BuildingNumberType{Value = "5"},
                                    CitySubdivisionName = new CitySubdivisionNameType{Value = "Merkez"},
                                    CityName = new CityNameType{Value = "Düzce"},
                                    PostalZone = new PostalZoneType{Value = "06200"},
                                    Country = new CountryType{Name = new NameType1{Value = "Türkiye"}}
                                }
                            },
                            DigitalSignatureAttachment = new AttachmentType { ExternalReference = new ExternalReferenceType { URI = new URIType { Value = "#Signature_" + faturaBilgileri.FaturaNo } } }
                        },
                    },
                AccountingSupplierParty = new SupplierPartyType
                {
                    Party = new PartyType
                    {
                        PartyIdentification = new[]
                        {
                            new PartyIdentificationType{ ID = new IDType{ schemeID = "VKN", Value = "1234567890" } },
                            new PartyIdentificationType{ ID = new IDType{ schemeID = "MERSISNO", Value = "1234567890123456" } },
                        },
                        PartyName = new PartyNameType { Name = new NameType1 { Value = "ŞAFAK TİCARET A.Ş." } },
                        PostalAddress = new AddressType
                        {
                            Room = new RoomType { Value = "5" },
                            BlockName = new BlockNameType { Value = "A Blok" },
                            BuildingName = new BuildingNameType { Value = "Burhaniye Mahallesi" },
                            BuildingNumber = new BuildingNumberType { Value = "5" },
                            CitySubdivisionName = new CitySubdivisionNameType { Value = "Merkez" },
                            CityName = new CityNameType { Value = "Düzce" },
                            PostalZone = new PostalZoneType { Value = "06200" },
                            Country = new CountryType { Name = new NameType1 { Value = "Türkiye" } }
                        },
                        WebsiteURI = new WebsiteURIType { Value = "www.safakkusmez.com" },
                        Contact = new ContactType { ElectronicMail = new ElectronicMailType { Value = "iletisim@safakkusmez.com" }, Telephone = new TelephoneType { Value = "555-5555555" } },
                        PartyTaxScheme = new PartyTaxSchemeType { TaxScheme = new TaxSchemeType { Name = new NameType1 { Value = "Düzce VD" } } }
                    },
                },
                AccountingCustomerParty = new CustomerPartyType
                {
                    Party = new PartyType
                    {
                        PartyIdentification = new[]
                        {
                            new PartyIdentificationType{ ID = new IDType{ schemeID = "TCKN", Value ="12345678901" } },
                        },
                        PartyName = new PartyNameType { Name = new NameType1 { Value = txtCariAdi.Text} },
                        PostalAddress = new AddressType
                        {
                            Room = new RoomType { Value = "14" },
                            BlockName = new BlockNameType { Value = "E Blok" },
                            BuildingName = new BuildingNameType { Value = "Aslan" },
                            BuildingNumber = new BuildingNumberType { Value = "1255" },
                            CitySubdivisionName = new CitySubdivisionNameType { Value = "Ardeşen" },
                            CityName = new CityNameType { Value = "Rize" },
                            PostalZone = new PostalZoneType { Value = "06400" },
                            Country = new CountryType { Name = new NameType1 { Value = "Türkiye" } }
                        },
                        Contact = new ContactType { ElectronicMail = new ElectronicMailType { Value = TxtMail.Text }, Telephone = new TelephoneType { Value = TxtTelefon.Text } },
                        Person = new PersonType { FirstName = new FirstNameType { Value = txtCariAdi.Text + " " + TxtCariSoyadı.Text }, FamilyName = new FamilyNameType { Value = txtCariAdi.Text+" "+TxtCariSoyadı.Text} },
                    },
                },
                TaxTotal = new[]
                {
                    new TaxTotalType{ TaxAmount = new TaxAmountType{ Value = faturaBilgileri.KdvTutari },
                        TaxSubtotal = new []
                        {
                            new TaxSubtotalType
                            {
                                TaxableAmount = new TaxableAmountType{ currencyID = "TRY",  Value = faturaBilgileri.NetTutar },
                                TaxAmount = new TaxAmountType{ currencyID = "TRY", Value = faturaBilgileri.KdvTutari },
                                CalculationSequenceNumeric = new CalculationSequenceNumericType{ Value = 1 },
                                TransactionCurrencyTaxAmount = new TransactionCurrencyTaxAmountType{ currencyID = "TRY", Value = faturaBilgileri.KdvTutari },
                                TaxCategory = new TaxCategoryType
                                {
                                    TaxScheme = new TaxSchemeType
                                    {
                                        Name = new NameType1{ Value = "KDV" },
                                        TaxTypeCode = new TaxTypeCodeType{ Value = "0015" }
                                    }
                                }
                            },
                        }}
                },
                LegalMonetaryTotal = new MonetaryTotalType
                {
                    LineExtensionAmount = new LineExtensionAmountType { Value = faturaBilgileri.Tutar },
                    TaxExclusiveAmount = new TaxExclusiveAmountType { Value = faturaBilgileri.NetTutar },
                    TaxInclusiveAmount = new TaxInclusiveAmountType { Value = faturaBilgileri.ToplamTutar },
                    AllowanceTotalAmount = new AllowanceTotalAmountType { Value = faturaBilgileri.Isklonto },
                    PayableAmount = new PayableAmountType { Value = faturaBilgileri.ToplamTutar }
                },
                InvoiceLine = FaturaHareketleri()
            };

            var settings = new XmlWriterSettings { OmitXmlDeclaration = true, Indent = true };
            var ms = new MemoryStream();
            var writer = XmlWriter.Create(ms, settings);
            var srl = new XmlSerializer(invoice.GetType());
            srl.Serialize(writer, invoice, XmlNameSpace());
            ms.Flush();
            ms.Seek(0, SeekOrigin.Begin);
            var srRead = new StreamReader(ms);
            var readXml = srRead.ReadToEnd();
            var path = Path.Combine($@"{Application.StartupPath}\EArsivFaturalar\{ invoice.ID.Value }.xml");

            void EFaturaOlustur()
            {
                using (var sWriter = new StreamWriter(path, false, Encoding.UTF8))
                {
                    sWriter.Write(readXml);
                    sWriter.Close();
                }
            }

            if (!Directory.Exists($@"{Application.StartupPath}\EArsivFaturalar"))
                Directory.CreateDirectory($@"{Application.StartupPath}\EArsivFaturalar");

            if (!File.Exists($@"{Application.StartupPath}\EArsivFaturalar\{ invoice.ID.Value }.xml"))
                EFaturaOlustur();

            else
                if (MessageBox.Show($@"{ invoice.ID.Value }.xml dosyasıdaha önce oluşturulmuş. Yeniden oluşturulsun mu?", "Onay", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                EFaturaOlustur();

            if (MessageBox.Show($@"Fatura oluşturma işlemi başarılı bir şekilde tamamlandı. Faturalar '{Application.StartupPath}\EArsivFaturalar' konumunda oluşturuldu. Konumu açmak istiyor musununz?", "Onay", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) != DialogResult.Yes) return;
            Process.Start(Application.StartupPath + "\\EArsivFaturalar");

            XmlSerializerNamespaces XmlNameSpace()
            {
                var ns = new XmlSerializerNamespaces();
                ns.Add("cac", "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2");
                ns.Add("xsi", "http://www.w3.org/2001/XMLSchema-instance");
                ns.Add("xades", "http://uri.etsi.org/01903/v1.3.2#");
                ns.Add("udt", "urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2");
                ns.Add("ubltr", "urn:oasis:names:specification:ubl:schema:xsd:TurkishCustomizationExtensionComponents");
                ns.Add("qdt", "urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2");
                ns.Add("ext", "urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2");
                ns.Add("cbc", "urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2");
                ns.Add("ccts", "urn:un:unece:uncefact:documentation:2");
                ns.Add("ds", "http://www.w3.org/2000/09/xmldsig#");
                return ns;
            }
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            var faturaBilgileri = new Fatura
            {
                CariKodu = txtCariKodu.Text,
                CariAdi = txtCariAdi.Text+" "+TxtCariSoyadı,
                Tarih = txtTarih.DateTime,
                FaturaNo = txtFaturaNo.Text,
                Tutar = txtTutar.Value,
                Isklonto = txtIskontoTutar.Value,
                NetTutar = txtNetTutar.Value,
                KdvTutari = txtKdvTutar.Value,
                ToplamTutar = txtToplamTutar.Value
            };

            FaturaOlustur(faturaBilgileri);
        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string GetDocumentText(string xmlFilePath, string xsltFilePath)
            {
                var xslTransForm = new XslCompiledTransform();
                var stringWriter = new StringWriter();
                var reader = XmlReader.Create(xsltFilePath, new XmlReaderSettings { DtdProcessing = DtdProcessing.Parse });
                xslTransForm.Load(reader);
                xslTransForm.Transform(xmlFilePath, null, stringWriter);
                return stringWriter.ToString();
            }

            var xml = $@"{Application.StartupPath}\EArsivFaturalar\{txtFaturaNo.Text}.xml";
            var xslt = $@"{Application.StartupPath}\general.xslt";

            var frm = new FaturaGoruntuleyici(GetDocumentText(xml, xslt));
            frm.ShowDialog();
        }

        private void ribbonControl1_Click(object sender, EventArgs e)
        {

        }

        private void FrmFatura_Load(object sender, EventArgs e)
        {

        }
    }
}