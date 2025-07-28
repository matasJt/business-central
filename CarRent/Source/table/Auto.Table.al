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
            Editable = false;
        }
        field(2; "Name"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Brand"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = AutoBrand.Code;
        }
        field(4; "Model"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = AutoModel."Model Code" where("Brand Code" = field("Brand"));
        }
        field(5; "Year"; Code[4])
        {
            DataClassification = CustomerContent;
             Numeric = true;
        }
        field(6; "Insurance"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(7; "Technical Inspection"; Date)
        {  
            DataClassification = CustomerContent;
        }
        field(8; LocalCode; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Location.Code;
        }
        field(9; RentService; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Resource;
        }
        field(10; Price; Decimal)
        {
            DecimalPlaces = 2;
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
}