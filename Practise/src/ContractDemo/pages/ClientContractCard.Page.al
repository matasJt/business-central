page 50137 ClientContractCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = ClientContract;
    Caption = 'Client Contract Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract number.';

                }
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the client number.';
                    Editable = Rec."Contract Status" <> ContractStatus::Released;
                }
                field("Client Type"; Rec."Client Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of client.';
                    Editable = Rec."Contract Status" <> ContractStatus::Released;
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract amount.';
                    Editable = Rec."Contract Status" <> ContractStatus::Released;

                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract start date.';
                    NotBlank = true;
                    ShowMandatory = true;
                    Editable = Rec."Contract Status" <> ContractStatus::Released;
                }

                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract end date.';
                    NotBlank = true;
                    ShowMandatory = true;
                    Editable = Rec."Contract Status" <> ContractStatus::Released;
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract status.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Release)
            {

                Caption = 'Release';
                Image = ReleaseDoc;
                ToolTip = 'Set the contract to released status.';
                trigger OnAction()
                begin
                    Rec.ChangeStatus();
                end;

            }
            action(Open)
            {

                Caption = 'Open';
                Image = ReOpen;
                ToolTip = 'Set the contract to open status.';
                trigger OnAction()
                begin
                    Rec.ChangeStatus();
                end;

            }
            action(CreateContractVersion)
            {
                ApplicationArea = All;
                Caption = 'Create Contract Version';
                Image = Create;
                ToolTip = 'Create a new version of the contract.';
                trigger OnAction()
                var
                    CreateContractVersion: Codeunit CreateContractVersion;
                begin
                    CreateContractVersion.CreateNewVersion(Rec);
                end;
            }
            action(OpenContractVersions)
            {
                ApplicationArea = All;
                Caption = 'Open Contract Versions';
                Image = Open;
                ToolTip = 'Open the contract versions for this contract.';
                trigger OnAction()
                var
                    CreateContractVersion: Codeunit CreateContractVersion;
                begin
                    CreateContractVersion.OpenContractVersions(Rec);
                end;
            }
        }
        area(Promoted)
        {
            actionref(Release_Promoted; Release)
            {

            }
            actionref(Open_Promoted; Open)
            {

            }
            group(CreateContractVersion_Promote)
            {
                Caption = 'Contract versions';
                actionref(OpenContractVersions_Promoted; OpenContractVersions)
                {

                }
                actionref(CreateContractVersion_Promoted; CreateContractVersion)
                {

                }
            }
        }
    }
    // trigger OnOpenPage()
    // var
    //     Msg: Label 'Contract is released and cannot be modified until it is reopened.';
    // begin
    //     if Rec."Contract Status" = ContractStatus::Released then
    //         Message(Msg);
    // end;
}
