  export const isValidCPF = ( strCPF ) => {
    var sum;
    var remain;
    var i;
    sum = 0;

    strCPF = strCPF.replace( /[\.-]/g, "" );

    if ( strCPF == "00000000000" || strCPF == 00000000000 ) return false;

    for ( i = 1; i <= 9; i++ ) sum = sum + parseInt( strCPF.substring( i - 1, i ) ) * ( 11 - i );
    remain = ( sum * 10 ) % 11;

    if ( ( remain == 10 ) || ( remain == 11 ) ) remain = 0;
    if ( remain != parseInt( strCPF.substring( 9, 10 ) ) ) return false;

    sum = 0;
    for ( i = 1; i <= 10; i++ ) sum = sum + parseInt( strCPF.substring( i - 1, i ) ) * ( 12 - i );
    remain = ( sum * 10 ) % 11;

    if ( ( remain == 10 ) || ( remain == 11 ) ) remain = 0;
    if ( remain != parseInt( strCPF.substring( 10, 11 ) ) ) return false;

    return true;
  }