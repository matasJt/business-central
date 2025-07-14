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
                    Rec."Contract Status" := ContractStatus::Released;
                    Rec.Modify(false);
                end;

            }
            action(Open)
            {

                Caption = 'Open';
                Image = ReOpen;
                ToolTip = 'Set the contract to open status.';
                trigger OnAction()
                begin
                    Rec."Contract Status" := ContractStatus::Open;
                    Rec.Modify(false);
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
