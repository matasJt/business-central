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
                    Caption = 'No.';
                    ToolTip = 'Unique identifier for the automobile.';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Name of the automobile.';
                }
                field(Brand; Rec.Brand)
                {
                    Caption = 'Brand';
                    ToolTip = 'Brand of the automobile.';
                }
                field(Model; Rec.Model)
                {
                    Caption = 'Model';
                    ToolTip = 'Model of the automobile.';
                }
                field(Year; Rec.Year)
                {
                    Caption = 'Manufacture year';
                    ToolTip = 'Year of manufacture of the automobile.';
                }
                field(Insurance; Rec.Insurance)
                {
                    Caption = 'Civil Insurance Expiration Date';
                    ToolTip = 'Civil nnsurance expiration date of the automobile.';
                }
                field("Technical Inspection"; Rec."Technical Inspection")
                {
                    Caption = 'Technical Inspection Expiration Date';
                    ToolTip = 'Technical inspection expiration date of the automobile.';
                }
                field(LocalCode; Rec.LocalCode)
                {
                    Caption = 'Local Code';
                    ToolTip = 'Local code of the automobile.';
                }
                field(RentService; Rec.RentService)
                {
                    Caption = 'Rent Service Type';
                    ToolTip = 'Rent service type for the automobile.';
                }
                field(Price; Rec.Price)
                {
                    Caption = 'Rent Service Type';
                    ToolTip = 'Rent service type for the automobile.';
                }
            }
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
                    Page.Run(Page::AutoAvailableReservations, AutoReservation);
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