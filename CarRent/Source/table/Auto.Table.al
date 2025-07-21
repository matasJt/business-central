table 50206 Auto
{
    DataClassification = CustomerContent;
    DrillDownPageId = AutoCard;
    LookupPageId = AutoList;

    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            ToolTip = 'Unique identifier for the automobile.';
            Editable = false;
        }
        field(2; "Name"; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
            ToolTip = 'Name of the automobile.';
        }
        field(3; "Brand"; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Brand';
            ToolTip = 'Brand of the automobile.';
            TableRelation = AutoBrand.Code;
        }
        field(4; "Model"; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Model';
            ToolTip = 'Model of the automobile.';
            TableRelation = AutoModel."Model Code" where("Brand Code" = field("Brand"));
        }
        field(5; "Year"; Code[4])
        {
            DataClassification = CustomerContent;
            Caption = 'Year';
            Numeric = true;
            ToolTip = 'Year of manufacture of the automobile.';

        }
        field(6; "Insurance"; Date)
        {
            Caption = 'Civil Insurance Expiration Date';
            ToolTip = 'Civil nnsurance expiration date of the automobile.';
            DataClassification = CustomerContent;
        }
        field(7; "Technical Inspection"; Date)
        {
            Caption = 'Technical Inspection Expiration Date';
            ToolTip = 'Technical inspection expiration date of the automobile.';
            DataClassification = CustomerContent;
        }
        field(8; LocalCode; Code[30])
        {
            Caption = 'Local Code';
            ToolTip = 'Local code of the automobile.';
            DataClassification = CustomerContent;
            TableRelation = Location.Code;
        }
        field(9; RentService; Code[30])
        {
            Caption = 'Rent Service Type';
            ToolTip = 'Rent service type for the automobile.';
            DataClassification = CustomerContent;
            TableRelation = Resource;
        }
        field(10; Price; Decimal)
        {
            Caption = 'Rent Price';
            DecimalPlaces = 2;
            ToolTip = 'Rent price of the automobile.';
            FieldClass = FlowField;
            CalcFormula = sum(Resource."Unit Price" where("No." = field(RentService)));
            Editable = false;
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
        AutoSetup: Record AutoSetup;
        Auto: Record Auto;
    begin
        AutoSetup.Get();
        "No." := NoSeries.GetNextNo(AutoSetup."Automobile No. Series");
        Auto.ReadIsolation(IsolationLevel::ReadUncommitted);
        Auto.SetLoadFields("No.");
        while Auto.Get("No.") do
            "No." := NoSeries.GetNextNo(AutoSetup."Automobile No. Series");
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}