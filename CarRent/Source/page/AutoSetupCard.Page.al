page 50201 AutoSetupCard
{    
    PageType = Card;
    SourceTable = AutoSetup;
    Caption = 'Auto setup Card';
    UsageCategory = Administration;
  
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Automobile No. Series"; Rec."Automobile No. Series")
                {                 
                }
                field("Nuomos kortelės serija"; Rec."Rent Card No. Series")
                {
                }
                field("Priedų vieta"; Rec."Accessories Location")
                {
                }
            }
        }
    }
}
