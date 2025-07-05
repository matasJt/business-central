pageextension 50125 CustomerList extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("No. of Bonuses"; Rec.Bonuses)
            {
                ApplicationArea=All;
                ToolTip = 'Specifies the number of assigned bonuses to the customer.';
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action(Bonuses)
            {
                Caption='Bonuses';
                ToolTip = 'Open the list of bonuses assigned to the customer.';
                ApplicationArea=All;
                Image=Discount;
                RunObject = page BonusList;
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }

    var
        myInt: Integer;
}