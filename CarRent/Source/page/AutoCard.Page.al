page 50208 AutoCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Auto;
    Caption = 'Auto Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {

                }
                field(Name; Rec.Name)
                {
                    NotBlank = true;
                }
                field(Mark; Rec.Brand)
                {

                }
                field(Model; Rec.Model)
                {

                }
                field(Year; Rec.Year)
                {
                    InstructionalText = 'Manufacture year';
                    trigger OnValidate()
                    begin
                        CheckDate();
                    end;
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
    }

    actions
    {
        area(Processing)
        {
            action(CheckReservations)
            {
                Caption = 'Open reservation';
                ToolTip = 'Opens reservation history page for this car';
                Image = OpenJournal;
                trigger OnAction()
                var
                    AutoReservation: Record AutoReservation;
                begin
                    AutoReservation.Reset();
                    AutoReservation.SetRange("Auto No.", Rec."No.");
                    Page.Run(Page::AutoReservationList,AutoReservation);
                end;
            }
        }
        area(Promoted)
        {

            actionref(CheckReservations_Promoted; CheckReservations)
            {
            }

        }
    }

    local procedure CheckDate()
    begin
        if (Rec.Year < '1900') or (Rec.Year > System.CurrentDateTime().Date.Year.ToText()) then
            Error('Incorrect year. Please enter a valid year between 1900 and the current year.');
    end;
}