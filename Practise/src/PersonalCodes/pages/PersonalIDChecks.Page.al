page 50133 "Personal ID Checks"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Personal ID Check History";
    Editable = false;
    Caption = 'History of personal ID checks';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Entry number';
                    ApplicationArea = All;
                }
                field(Input; Rec.Input)
                {
                    ToolTip = 'Inputed value for check';
                    ApplicationArea = All;
                }

                field(Correct; Rec.Correct)
                {
                    ToolTip = 'If passed ID checked';
                    ApplicationArea = All;
                }
                field(Error; Rec.Error)
                {
                    ToolTip = 'Error due to not passing';
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Checked at"; Rec."Checked at")
                {
                    ToolTip = 'Time then was checked';
                    ApplicationArea = All;
                }
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(CheckPersonalID)
            {
                ApplicationArea = All;
                Caption = 'Check Personal ID';
                ToolTip = 'Open card for personal ID check';
                Image = Check;
                RunObject = page "Personal ID Check";
                RunPageMode = Create;
            }
            action(DeleteHistory)
            {
                ApplicationArea = All;
                Caption = 'Delete history';
                ToolTip = 'Deletes history of all personal ID checks';
                Image = Delete;
                trigger OnAction()
                var
                    confirm: Boolean;
                    HistoryRecord: Record "Personal ID Check History";
                begin
                    confirm := Dialog.Confirm('Delete history?');
                    if confirm then
                        HistoryRecord.DeleteAll();
                end;

            }
        }
    }
}