<!doctype html>
<html>
	<style type="text/css">
	
        @page {
        header: page-header;
        footer: page-footer;
        }
       table th , td{
        
        padding-left: 0.35em;
        padding-right: 0.35em;
        padding-top: 0.35em;
        padding-bottom: 0.35em;
        vertical-align: top;
        border:1px solid black;
        
        }
        /*table td {
            padding-left: 0.35em;
            padding-right: 0.35em;
            padding-top: 0.35em;
            padding-bottom: 0.35em;
            vertical-align: top;
            border:1px solid black;

        }*/
    </style>
    <body>
       <!-- fund  inward log table  -->
        <htmlpageheader name="page-header">
            Syslogyx Financial Management
        </htmlpageheader>
        <hr>
        <h3 style="text-align:center;font-family:Calibri (Body);"> Transaction Details</h3>
        <div>
            <table style="font-family:Calibri (Body);border-collapse: collapse;" width="100%">
                <thead width="100%">
                    <tr>
                        <th width="10%" style="text-align:center">Sr No.</th>
                        <th width="15%" style="text-align:center">Date</th>
                        <th width="35%" style="word-wrap: break-word;text-align: justify;word-break: break-all;text-align:center">Narration</th>
                        <th width="10%" style="text-align:center;color:#ca0a0a">Debit</th>
                        <th width="10%" style="text-align:center;color:#1e9638">Credit</th>
                        <th width="20%" style="text-align:center">Balance (Rs.)</th>
                    </tr>
                </thead>
                <tbody>
                	@foreach ($data as $key => $fn)
                    <tr>
                        <td style="text-align:center">{{++$key}}</td>
                        <td style="text-align:center">{{$fn->date}}</td>
                        <td style="word-wrap: break-word;text-align: justify;word-break: break-all;">{{$fn->remark}}</td>
                        <td style="text-align:center;color:#ca0a0a">{{$fn->banking_type == "credit" ? "-" :$fn->fund_inward_amount}}</td>
                        <td style="text-align:center;color:#1e9638">{{$fn->banking_type == "debit" ? "-" :$fn->fund_inward_amount}}</td>
                        <td style="text-align:center">{{$fn->total_amount}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
           </div>

           <htmlpagefooter name="page-footer">
                <hr>
                <span style="text-align: center">{PAGENO}</span>
               <!--  {DATE j-m-Y} -->
            </htmlpagefooter>
    </body>
</html>