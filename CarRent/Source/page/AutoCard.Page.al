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
                    Caption = 'Name';
                    ToolTip = 'Custom name of a car';
                    NotBlank = true;
                    InstructionalText = 'Custom car name';
                }
                field(Brand; Rec.Brand)
                {
                    Caption = 'Car Brand';
                    ToolTip = 'Speficies car brand';
                }
                field(Model; Rec.Model)
                {
                    Caption = 'Car Model';
                    ToolTip = 'Specifies car model';
                }
                field(Year; Rec.Year)
                {
                    Caption = 'Car Year';
                    ToolTip = 'When car was made';
                    InstructionalText = 'Manufacture year';
                    trigger OnValidate()
                    begin
                        CheckDate();
                    end;
                }
                field(Insurance; Rec.Insurance)
                {
                    ToolTip = 'Car insurance end date';
                }
                field("Technical Inspection"; Rec."Technical Inspection")
                {
                    ToolTip = 'End date of tecnhinal inspection';
                }
                field(LocalCode; Rec.LocalCode)
                {
                    ToolTip = 'Place of accesories';
                }
                field(RentService; Rec.RentService)
                {
                    ShowMandatory = true;
                    NotBlank = true;
                    ToolTip = 'Rent service type';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Price for renting a car not including additional services';
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
                    Page.Run(Page::AutoReservationList, AutoReservation);
                end;
            }
            action(OpenDamageList)
            {
                Caption = 'Open damages';
                ToolTip = 'Opens all registered damgages for this car';
                Image = Journal;
                trigger OnAction()
                var
                    AutoDamage: Record AutoDamage;
                begin
                    AutoDamage.SetRange("Auto No.", Rec."No.");
                    Page.Run(Page::AutoDamageList, AutoDamage);
                end;
            }
        }
        area(Promoted)
        {

            actionref(CheckReservations_Promoted; CheckReservations)
            {
            }


            actionref(OpenDamageList_Promoted; OpenDamageList)
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