page 50232 DrivingLicenseCopy
{
    Caption = 'Driving License';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = FinishedAutoRentHeader;

    layout
    {
        area(content)
        {
            field(Image; Rec."Driving License")
            {
                ApplicationArea = All;
                ShowCaption=false;
            }
        }

    }
}