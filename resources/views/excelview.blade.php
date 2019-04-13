<!doctype html>
<html>
    <body>
       <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel-body">
                    <table style="font-family:Calibri (Body);">
                        <thead>
                            <th></th><th></th>
                            <th style="text-align:center">Syslogyx Financial Management</th>
                            <th></th><th></th>
                        </thead>
                    </table>
                    <br>
                    <table style="font-family:Calibri (Body);">
                        <thead>
                            <th></th><th></th>
                            <th style="text-align:center;">Transaction Details</th>
                            <th></th><th></th>
                        </thead>
                    </table>
                    <br>
                    <table style="font-family:Calibri (Body);">
                        <thead>
                            <tr>
                                <th style="text-align:center">Sr No.</th>
                                <th style="text-align:center">Date</th>
                                <th style="word-wrap: break-word;text-align: justify;word-break: break-all;text-align:center">Narration</th>
                                <th style="text-align:center;color:#ca0a0a">Debit</th>
                                <th style="text-align:center;color:#1e9638">Credit</th>
                                <th style="text-align:center">Balance (Rs.)</th>
                            </tr>
                        </thead>
                        <tbody>
                        	@foreach ($data as $key => $fn)
                            <tr>
                                <td style="text-align:center">{{++$key}}</td>
                                <td style="text-align:center">{{$fn->date}}</td>
                                <td style="word-wrap: break-word;text-align: justify;text-justify: inter-word;word-break: break-all;">{{$fn->remark}}</td>
                                <td style="text-align:center;color:#ca0a0a">{{$fn->banking_type == "credit" ? "-" :$fn->fund_inward_amount}}</td>
                                <td style="text-align:center;color:#1e9638">{{$fn->banking_type == "debit" ? "-" :$fn->fund_inward_amount}}</td>
                                <td style="text-align:center">{{$fn->total_amount}}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                   </div>
                </div>
            </div>
        </div>
    </body>
</html>
