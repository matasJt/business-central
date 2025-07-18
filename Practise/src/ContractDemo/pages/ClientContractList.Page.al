page 50136 ClientContractList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ClientContract;
    CardPageId = ClientCOntractCard;
    Editable = false;
    Caption = 'Client Contracts';

    layout
    {
        area(Content)
        {
            repeater(General)
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
                }
                field("Client Type"; Rec."Client Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of client.';
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract amount.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract start date.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract end date.';
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
                ApplicationArea = All;
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
                ApplicationArea = All;
                Caption = 'Open';
                Image = ReOpen;
                ToolTip = 'Set the contract to open status.';
                trigger OnAction()
                begin
                   Rec.ChangeStatus();
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
}