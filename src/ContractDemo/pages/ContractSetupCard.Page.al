page 50139 ContractSetupCard
{

    PageType = Card;
    SourceTable = ContractSetup;
    Caption = 'Contract Setup';
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Contract Nos"; Rec."Contract Nos")
                {
                    ToolTip = 'Specifies the contract numbers.';
                    ApplicationArea = All;
                }
                
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
