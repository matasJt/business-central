page 50201 AutoSetupCard
{    
    PageType = Card;
    SourceTable = AutoSetup;
    Caption = 'Auto setup Card';
    UsageCategory = Administration;
    ApplicationArea = All;
  
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Automobile No. Series"; Rec."Automobile No. Series")
                {          
                    ToolTip='Specifies the No. series of automobile from catagory list';       
                }
                field("Nuomos kortelės serija"; Rec."Rent Card No. Series")
                {
                    ToolTip='Specifies the unique No. series of auto rent record';
                }
                field("Priedų vieta"; Rec."Accessories Location")
                {
                    ToolTip='The place where accessories are stored';
                }
            }
        }
    }
}
