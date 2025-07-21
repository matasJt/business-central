page 50207 AutoList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Auto;
    CardPageId = AutoCard;
    Caption = 'Auto List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {

                }
                field(Name; Rec.Name)
                {

                }
                field(Brand; Rec.Brand)
                {

                }
                field(Model; Rec.Model)
                {

                }
                field(Year; Rec.Year)
                {

                }
                field(Insurance; Rec.Insurance)
                {

                }
                field("Technical Inspection"; Rec."Technical Inspection")
                {

                }
                field(LocalCode; Rec.LocalCode)
                {
                }
                field(RentService; Rec.RentService)
                {
                }
                field(Price; Rec.Price)
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowReservation)
            {
                Caption = 'Show reservations';
                ToolTip = 'Opens page of reservations of selected cars';
                Image = ShowList;
                trigger OnAction()
                var
                    AutoReservation: Record AutoReservation;
                    AutoReservationList: Page AutoReservationList;
                begin
                    Page.Run(Page::AutoReservationList);
                end;
            }
            action(OpenReservation)
            {
                Caption = 'Open active reservations';
                ToolTip = 'Open page of active reservations for selected car';
                Image = Open;
                trigger OnAction()
                begin

                end;
            }
        }
        area(Promoted)
        {
            group(Reservation)
            {
                actionref(Open; ShowReservation) { }
            }
        }
    }
}