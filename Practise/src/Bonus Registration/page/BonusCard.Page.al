page 50121 BonusCard
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = BonusHeader;
    Caption='Bonus card';
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption='General';
                 field("No."; Rec."No.")
                {
                    ApplicationArea=All;
                    ToolTip='Specifies the bonus number.';
                }
                field("Customer No"; Rec."Customer No.")
                {
                    ApplicationArea=All;
                    ToolTip='Specifies the customer number';
                }
                field("Stating Date"; Rec."Starting Date")
                {
                    ApplicationArea=All;
                    ToolTip='Specifies the starting date';
                }
                 field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea=All;
                    ToolTip='Specifies the ending date';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea=All;
                    ToolTip='Specifices the bonus status';
                }
                part(Lines; BonusSubForm)
                {
                    ApplicationArea=All;
                    Caption='Lines';
                    SubPageLink = "Document No." = field("No.");
                }           
            }
        }
    }
    
    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {  
              ApplicationArea=All;
              Caption='Customer Card';
              ToolTip='Open customer card for the bonus';
              Image=Customer;
              RunObject= page "Customer Card";
              RunPageLink = "No." = field("Customer No.");
            }
            action(BonusEntries)
            {
                ApplicationArea=All;
                Caption='Bonus entry';
                ToolTip='Open bonus entries';
                Image=Entry;
                RunObject= page BonusEntries;
                RunPageLink="Bonus No." = field("No.");
            }
        }
    }
    
    var
        myInt: Integer;
}