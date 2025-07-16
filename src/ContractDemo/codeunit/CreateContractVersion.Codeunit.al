codeunit 50146 CreateContractVersion
{
    var
        ContractVersion: Record ContractVersion;
    /// <summary>
    /// Create a new version of the contract.
    /// </summary>
    /// <param name="Data">Original contract data.</param>
    procedure CreateNewVersion(Data: Record ClientContract)
    var
        ContractVersionSerialNumber: Integer;
        ClientContract: Record ClientContract;
    begin
        if not (Data.Get(Data."Contract No.",Data."Client No.")) then
            Error('Client contract not found to add version of it');

        ClientContract := Data;
        ContractVersion.SetFilter("Contract No.", ClientContract."Contract No.");

        if ContractVersion.FindLast() then begin
            ContractVersionSerialNumber := ContractVersion."Contract Version No." + 1;
            InsertToTable(ContractVersionSerialNumber, ClientContract);
        end else begin
            ContractVersionSerialNumber := 1;
            InsertToTable(ContractVersionSerialNumber, ClientContract);
        end;
    end;

    /// <summary>
    /// Open the contract versions for a specific client contract.
    /// </summary>
    /// <param name="Data">Original contract data.</param>
    procedure OpenContractVersions(Data: Record ClientContract)
    begin
        ContractVersion.SetRange("Contract No.", Data."Contract No.");
        if ContractVersion.FindFirst() then begin
            Page.Run(Page::ContractVersionList, ContractVersion);
        end else begin
            Error('No contract versions found for the specified contract.');
        end;
    end;

    local procedure InsertToTable(SerialNumber: Integer; ClientContract: Record ClientContract)
    begin
        ContractVersion.Init();
        ContractVersion."Contract Version No." := SerialNumber;
        ContractVersion."Contract No." := ClientContract."Contract No.";
        ContractVersion."Client No." := ClientContract."Client No.";
        ContractVersion."Client Type" := ClientContract."Client Type";
        ContractVersion."Contract Amount" := ClientContract."Contract Amount";
        ContractVersion."Contract Start Date" := ClientContract."Contract Start Date";
        ContractVersion."Contract End Date" := ClientContract."Contract End Date";
        ContractVersion."Contract Status" := ClientContract."Contract Status";
        ContractVersion.Insert(false);
    end;
}