table 50216 AutoRentLine
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(2; "Row No."; Code[30])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(3; Type; Enum RentLineType)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No."; Code[30])
        {
            TableRelation = if (Type = const(Resource)) Resource
            else
            Item;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Row No." <> '' then
                    FillFields();
            end;
        }
        field(5; Description; Text[50])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                FillFields();
            end;
        }
        field(7; Price; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(8; Sum; Decimal)
        {
            Editable = false;
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }
        field(9; Deleteable; Boolean)
        {
            InitValue = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document No.", "Row No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        NewRowNo();
    end;

    trigger OnModify()
    var
        ModifyMsg: Label 'Generated record cannot be modified';
    begin
        if Deleteable = false then
            Error(ModifyMsg);
    end;

    trigger OnDelete()
    var
        DeleteMsg: Label 'Generated record cannot be deleted';
    begin
        if Deleteable = false then
            Error(DeleteMsg);
    end;


    /// <summary>
    /// Fill necessary fields of service
    /// </summary>
    procedure FillFields()
    var
        Resource: Record Resource;
        Item: Record Item;
    begin
        if "No." = '' then
            exit;
        if Type = Type::Item then begin
            Item.Get("No.");
            Price := Item."Unit Price";
            Sum := Price * Quantity;
            Description := Item.Description;
        end else begin
            Resource.Get("No.");
            Price := Resource."Unit Price";
            Sum := Price * Quantity;
            Description := Resource.Name;
        end;

        Modify(false);
    end;

    procedure NewRowNo()
    var
        NoSeries: Codeunit "No. Series";
        DocNo: Record "No. Series";
    begin
        DocNo.Get('FA');
        Rec."Row No." := NoSeries.GetNextNo(DocNo.Code);
        Rec.ReadIsolation(IsolationLevel::ReadUncommitted);
        Rec.SetLoadFields("Row No.");

        while Rec.Get(Rec."Row No.") do
            Rec."Row No." := NoSeries.GetNextNo(DocNo.Code);
    end;

}