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
    actions
    {
        area(processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                var
                    InStream: InStream;
                    FileName: Text;
                    FileUploaded: Boolean;
                    Extension: Text;
                    SelectPictureTxt: Label 'Select a picture to import';
                    Image: Codeunit Image;
                begin
                    FileUploaded := UploadIntoStream(SelectPictureTxt, '', '', FileName, InStream);
                    if not FileUploaded then
                        exit;

                    Extension := LowerCase(CopyStr(FileName, StrLen(FileName) - 3, 4));
                    if not (Extension in ['.jpg', '.png', '.bmp']) then
                        Error('Only image files (JPG, PNG, BMP, GIF) are allowed.');

                    Clear(Rec."Driving License");
                    Rec."Driving License".ImportStream(InStream, FileName);

                    Rec.Modify(false);
                end;
            }
            action(Delete)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Image = Delete;
                ToolTip = 'Delete the current picture.';

                trigger OnAction()
                begin
                    if not Rec."Driving License".HasValue then
                        exit;

                    if Confirm('Are you sure you want to delete the current picture?', false) then begin
                        Clear(Rec."Driving License");
                        Rec.Modify(false);
                    end;
                end;
            }

        }
    }
}