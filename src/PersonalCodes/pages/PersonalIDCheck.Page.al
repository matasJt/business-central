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
    begin
        if (CloseAction = Action::OK) and (Rec.Input <> '') then begin
            IsValid := true;
            ValidatePersonalID(Rec.Input, IsValid, Error);

            if HistoryRec.Get(Rec."No.") then begin
                HistoryRec.Correct := IsValid;
                HistoryRec.Error := Error;
                HistoryRec."Checked at" := System.Time();
                HistoryRec.Modify(true);
            end;
            if IsValid then
                Message('Added to history, personal ID is correct')
            else
                Message('Added to history, personal ID is invalid');
        end;
    end;

    local procedure ValidatePersonalID(Input: Text; var IsValid: Boolean; var Error: Text): Boolean
    var
        UniqueNumber: Integer;                        //Last digit of personal id, calculated from first 10 digits
    begin  
        if not (Input[1] in ['1' .. '6']) then begin
            Error := ' First digit must be 1-6 \';
            IsValid := false;
        end;
        ValidateBirthDate(Error, Input, IsValid);
        UniqueNumber := CalculateUniqueNumber(Input);
        if UniqueNumber.ToText() <> Input[11] then begin
            Error += ' Last digit "unique number" is incorrect \';
            IsValid := false;
        end;

        exit(IsValid);
    end;

    local procedure ValidateBirthDate(var Error: Text; Input: Text; var IsValid: Boolean)
    var
        TwoDigits: Text;
    begin
        //Month
        TwoDigits := Format(Input[4]) + Format(Input[5]);
        if not (TwoDigits in ['01' .. '12']) then begin
            Error += ' Incorrect birth date month format \';
            IsValid := false;
        end;
        //Day
        TwoDigits := Format(Input[6]) + Format(Input[7]);
        if not (TwoDigits in ['01' .. '31']) then begin
            Error += ' Incorrect birth date day format \';
            IsValid := false;
        end;
    end;

    local procedure CalculateUniqueNumber(Input: Text): Integer
    var
        SumOfDigits: Integer;
        i: Integer;
        Digits: array[10] of Integer;
    begin
        SumOfDigits := 0;

        for i := 1 to 10 do
            Evaluate(Digits[i], Input[i]);
        for i := 1 to 9 do
            SumOfDigits += Digits[i] * i;
        SumOfDigits += Digits[10] * 1;

        if SumOfDigits mod 11 <> 10 then
            exit(SumOfDigits mod 11);

        SumOfDigits := 0;
        for i := 3 to 9 do
            SumOfDigits += Digits[i - 2] * i;
        SumOfDigits += Digits[8] * 1 + Digits[9] * 2 + Digits[10] * 3;

        if SumOfDigits mod 11 <> 10 then
            exit(SumOfDigits mod 11)
        else
            exit(0);
    end;
}