page 50132 "Personal ID Check"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    SourceTable = "Personal ID Check History";
    Caption = 'Check personal ID';
    Editable = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Input';
                field("Personal ID"; Rec.Input)
                {
                    ToolTip = 'Specifies personal ID';
                    ApplicationArea = All;
                    NotBlank = true;
                    Numeric=true;
                    trigger OnValidate()
                    begin
                        if StrLen(Rec.Input) < 11 then
                            Error('Personal ID length must be 11.');
                    end;

                }

            }
        }
    }


    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        IsValid: Boolean;
        Error: Text;
        HistoryRec: Record "Personal ID Check History";
        Validation: Codeunit PersonalIDValidation;
    begin
        if (CloseAction = Action::OK) and (Rec.Input <> '') then begin
            IsValid := true;
            Validation.ValidatePersonalID(Rec.Input, IsValid, Error);

            if HistoryRec.Get(Rec."No.") then begin
                HistoryRec.Correct := IsValid;
                HistoryRec.Error := Error;
                HistoryRec."Checked at" := CurrentDateTime();
                HistoryRec.Modify(true);
            end;
            if IsValid then
                Message('Added to history, personal ID is correct')
            else
                Message('Added to history, personal ID is invalid');
        end;
    end;
}