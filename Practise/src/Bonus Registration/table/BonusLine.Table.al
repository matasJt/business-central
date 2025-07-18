table 50119 BonusLine
{
    DataClassification = CustomerContent;
    Caption = 'Bonus Line';
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            TableRelation = BonusHeader."No.";
        }
        field(2; Type; Enum BonusLineType)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = if (Type = filter(Item)) Item;
        }
        field(4; "Bonus Perc."; Integer)
        {
            Caption = 'Bonus Perc.';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        key(PK1; "Document No.", "Item No.", Type)
        {

            Clustered = true;
        }

    }

    local procedure TestStatus()
    var
        BonusHeader: Record BonusHeader;
        ErrorMessage: Label 'Status cannot be %1', Comment = '% Status field value';
    begin
        if BonusHeader.Get(Rec."Document No.") then
            if BonusHeader.Status = BonusHeader.Status::Released then
                Error(ErrorMessage, BonusHeader.Status)
    end;

    trigger OnInsert()
    begin
        TestStatus();
    end;

    trigger OnModify()
    begin
        TestStatus();
    end;

    trigger OnDelete()
    begin
        TestStatus();
    end;

    trigger OnRename()
    begin
        TestStatus();
    end;

}