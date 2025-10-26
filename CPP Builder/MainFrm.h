//---------------------------------------------------------------------------

#ifndef MainFrmH
#define MainFrmH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Dialogs.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TGroupBox *grpFIO;
	TGroupBox *grpResult;
	TGroupBox *grpOffice;
	TMemo *mResult;
	TComboBox *cbFIO;
	TComboBox *cbOffice;
	TComboBox *cbAppointment;
	TLabel *lbFIO;
	TLabel *lbOffice;
	TLabel *lbAppointment;
	TButton *btnDecl;
	TButton *btnDeclApp;
	TButton *btnDeclOff;
	TEdit *eF;
	TEdit *eI;
	TEdit *eO;
	TLabel *lbI;
	TLabel *lbO;
	TComboBox *cbSex;
	TLabel *lbSex;
	TButton *btnNewDict;
	TButton *btnLoadChange;
	TButton *btnApp_Off;
	TStatusBar *sbMain;
	TOpenDialog *OpenDialog1;
	void __fastcall cbFIOChange(TObject *Sender);
	void __fastcall btnDeclClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall btnApp_OffClick(TObject *Sender);
	void __fastcall btnDeclAppClick(TObject *Sender);
	void __fastcall btnDeclOffClick(TObject *Sender);
	void __fastcall grpResultDblClick(TObject *Sender);
	void __fastcall btnNewDictClick(TObject *Sender);
	void __fastcall btnLoadChangeClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
