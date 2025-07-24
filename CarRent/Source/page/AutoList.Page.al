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
            action(OpenReservation)
            {
                Caption = 'Open reservations';
                ToolTip = 'Open page of active reservations from today.';
                Image = OpenJournal;
                trigger OnAction()
                var
                    AutoReservation: Record AutoReservation;
                begin
                    AutoReservation.Reset();
                    AutoReservation.SetFilter("Reservation Start Time", '>=%1', CreateDateTime(Today, 0T));
                    Page.Run(Page::AutoAvailableReservationsPage,AutoReservation);
                end;
            }
        }
        area(Promoted)
        {      
                actionref(OpenReservation_Promoted; OpenReservation)
                {
                }
            
        }
    }
}