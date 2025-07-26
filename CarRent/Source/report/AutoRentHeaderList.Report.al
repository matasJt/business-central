report 50235 AutoRentHeaderList
{
    UsageCategory = None;
    ApplicationArea = All;
    DefaultRenderingLayout = AutoRentHeaderPrintLayout;
    Caption = 'Auto rent report';


    dataset
    {

        dataitem(AutoRentHeader; "AutoRentHeader")
        {
            DataItemTableView = sorting("No.");
            column(DocumentNo; "No.") { }
            column(CarNo; "Auto No.") { }
            column(ReservationPeriod; Format("Reservation Start Time") + ' - ' + Format("Reservation End Time")) { }
            
            dataitem(AutoRentLine; "AutoRentLine")
            {
                DataItemTableView = sorting("Document No.");
                DataItemLink = "Document No." = FIELD("No.");
                column(LineDescription; Description) { }
                column(Quantity; Quantity) { }
                column(Price; Price) { }
                column(Sum; Sum) { }
            }
            dataitem(Customer; Customer)
            {
                DataItemTableView = sorting("No.");
                DataItemLink = "No." = FIELD("Client No.");

                column(Name_Customer; Name)
                {
                }
            }
            dataitem(Auto; Auto)
            {
                DataItemTableView = sorting("No.");
                DataItemLink = "No." = FIELD("Auto No.");
                column(Brand_Auto; Brand)
                {
                }
                column(Model_Auto; Model)
                {
                }
            }
        }
    }

    rendering
    {
        layout(AutoRentHeaderPrintLayout)
        {
            Type = Word;
            Caption = 'Auto rent list (print)';
            Summary = 'Auto rent list with services';
            LayoutFile = 'doc/AutoRentHeaderList.docx';
        }
    }




    var
        RentalAmount: Decimal;
        ServiceAmount: Decimal;
}
