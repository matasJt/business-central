page 50215 DrivingLicense
{
    Caption = 'Driving License';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = AutoRentHeader;

    layout
    {
        area(content)
        {
            field(Image; Rec."Driving License")
            {
                ApplicationArea = All;
                ShowCaption = false;
            }
        }
    }
}