report 50236 FinishedAutoRent
{
    UsageCategory = None;
    ApplicationArea = All;
    DefaultRenderingLayout = FinishedRentPrintLayout;
    Caption = 'Finished auto rent report';

    dataset
    {
        dataitem(FinishedAutoRentHeader; FinishedAutoRentHeader)
        {
            DataItemTableView = sorting("Reservation Start Time", "No.");
            column(DocumentNo; "No.") { }
            column(CarNo; "Auto No.") { }
            column(RentPrice; "Rent Price") { }
            column(ReservationStartTime; "Reservation Start Time") { }
            column(ReservationEndTime; "Reservation End Time") { }

            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = FIELD("Client No.");
                DataItemTableView = sorting("No.");
                column(Name_Customer; Name) { }
            }

            dataitem(Auto; Auto)
            {
                DataItemTableView = sorting("No.");
                DataItemLink = "No." = FIELD("Auto No.");
                column(Brand_Auto; Brand) { }
                column(Model_Auto; Model) { }
            }

            trigger OnPreDataItem()
            begin
                if (StartDate <> 0DT) and (EndDate <> 0DT) then begin
                    SetFilter("Reservation Start Time", '<=%1', EndDate);
                    SetFilter("Reservation End Time", '>=%1', StartDate);
                end else begin
                    if StartDate <> 0DT then
                        SetFilter("Reservation End Time", '>=%1', StartDate);
                    if EndDate <> 0DT then
                        SetFilter("Reservation Start Time", '<=%1', EndDate);
                end;
                if AutoNoFilter <> '' then
                    SetRange("Auto No.", AutoNoFilter);

                TotalRentPrice := 0;
            end;

            trigger OnAfterGetRecord()
            begin
                TotalRentPrice += "Rent Price";
            end;
        }

        dataitem(TotalPrice; Integer)
        {

            column(TotalRentPrice_Final; TotalRentPrice) { }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Date Filters")
                {
                    field("Auto No."; AutoNoFilter)
                    {
                        ToolTip='Selection of car from auto list';
                        TableRelation = Auto;
                    }
                    field("Start Date"; StartDate)
                    {
                        Caption = 'Reservation Start Date';
                    }
                    field("End Date"; EndDate)
                    {
                        Caption = 'Reservation End Date';
                    }
                }
            }
        }
    }

    rendering
    {
        layout(FinishedRentPrintLayout)
        {
            Type = Word;
            Caption = 'Finished auto rent (print)';
            Summary = 'Finished Auto rent with services';
            LayoutFile = 'doc/FinishedAutoRentHeaderList.docx';
        }
    }

    var
        StartDate: DateTime;
        EndDate: DateTime;
        AutoNoFilter: Code[30];
        TotalRentPrice: Decimal;
}
