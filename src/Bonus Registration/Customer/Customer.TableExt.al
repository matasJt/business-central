tableextension 50123 Customer extends Customer
{
    fields
    {
        field(50123; Bonuses; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Bonuses';
            CalcFormula = count(BonusHeader where("Customer No." = field("No.")));
            Editable = false;

        }

    }
    trigger OnBeforeDelete()
    begin
        TestIfBonusExists();
    end;

    var
        BonusHeader: Record BonusHeader;
        Message : Label 'At least one bonus for %1 exists', Comment = '%1 - customer name';

    local procedure TestIfBonusExists()
    begin
        BonusHeader.SetRange("Customer No.", Rec."No.");
        if not BonusHeader.IsEmpty then
            Error(Message, Rec.Name);
    end;
}