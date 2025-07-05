codeunit 50128 BonusCalculation
{
    EventSubscriberInstance = StaticAutomatic;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure RunAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusHeader: Record BonusHeader;
    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;
        BonusHeader.SetRange(Status, BonusHeader.Status::Released);
        BonusHeader.SetRange("Customer No.", SalesInvLine."Bill-to Customer No.");
        // BonusHeader.SetFilter("Starting Date", '..%1',SalesInvLine."Posting Date");
        // BonusHeader.SetFilter("Ending Date",'%1..',SalesInvLine."Posting Date");

        if BonusHeader.FindSet() then
            repeat
                FindBonusForAllItems(BonusHeader, SalesInvLine);
                FindBonusForOneItem(BonusHeader, SalesInvLine);
            until BonusHeader.Next() = 0;


    end;

    local procedure FindBonusForOneItem(var BonusHeader: Record BonusHeader; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusLine: Record BonusLine;
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::Item);
        BonusLine.SetRange("Item No.", SalesInvLine."No.");
        if BonusLine.FindFirst() then
            InsertBonusEntry(BonusLine, SalesInvLine);
    end;

    local procedure FindBonusForAllItems(var BonusHeader: Record BonusHeader; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusLine: Record BonusLine;
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::AllItems);
        if BonusLine.FindFirst() then
            InsertBonusEntry(BonusLine, SalesInvLine);
    end;

    local procedure InsertBonusEntry(var BonusLine: Record BonusLine; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusEntry: Record BonusEntry;
    begin
        BonusEntry.Init();
        BonusEntry."Entry No." := 0;
        BonusEntry."Bonus No." := BonusLine."Document No.";
        BonusEntry."Document No." := SalesInvLine."Document No.";
        BonusEntry."Item No." := SalesInvLine."No.";
        BonusEntry."Posting Date" := SalesInvLine."Posting Date";
        BonusEntry."Bonus Amount" := SalesInvLine."Line Amount" * BonusLine."Bonus Perc." / 100;
        OnBeforeInsertBonusEntry(BonusLine, SalesInvLine);
        BonusEntry.Insert();
        OnAfterInsertBonusEntry(BonusLine, SalesInvLine);
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertBonusEntry(var BonusLine: Record BonusLine; var SalesInvLine: Record "Sales Invoice Line")
    begin


    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInsertBonusEntry(var BonusLine: Record BonusLine; var SalesInvLine: Record "Sales Invoice Line")
    begin

    end;
}
