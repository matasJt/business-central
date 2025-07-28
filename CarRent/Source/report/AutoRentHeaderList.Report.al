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
            column(Rent_Price;"Rent Price"){}
            column(ReservationPeriod; Format("Reservation Start Time") + ' - ' + Format("Reservation End Time")) { }

            dataitem(AutoRentLine; "AutoRentLine")
            {
                DataItemTableView = sorting("Document No.");
                DataItemLink = "Document No." = FIELD("No.");
                column(LineDescription; Description) { }
                column(Quantity; Quantity) { }
                column(Price; Price) { }
                column(Sum; Sum) { }

                trigger OnAfterGetRecord()
                begin
                    if AutoRentLine.Deleteable = false then
                        RentalAmount := AutoRentLine.Sum
                    else
                        ServiceAmount += AutoRentLine.Sum;
                end;
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
         dataitem(TotalPrice; Integer)
            {

                column(ServiceAmount;ServiceAmount) { }
                column(RentalAmount;RentalAmount){}

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1);
                end;
            }
    }

    rendering
    {
        layout(AutoRentHeaderPrintLayout)
        {
            Type = Word;
            Caption = 'Auto rent (print)';
            Summary = 'Auto rent with services';
            LayoutFile = 'doc/AutoRentHeaderList.docx';
        }
    }


    var
        RentalAmount: Decimal;
        ServiceAmount: Decimal;
}
