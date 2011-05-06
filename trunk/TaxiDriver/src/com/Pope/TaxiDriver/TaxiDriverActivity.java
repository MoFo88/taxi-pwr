package com.Pope.TaxiDriver;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.MarshalFloat;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import android.app.Activity;
import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class TaxiDriverActivity extends Activity
{
	//private int					minCounter				= 0;
	private long				prevTime				= 0;
	private static final String	NAMESPACE				= "http://localhost/TestWebService/";
	private static final String	URL						= "http://156.17.237.27/Server/WebService.asmx";
	private static final String	METHOD_NAME1			= "setTaxiStatus";
	private static final String	METHOD_NAME2			= "setTaxiCoord";
	//private boolean				isResultVector			= false;
	private int					statId				= 0;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		setContentView(R.layout.main);

		LocationManager mlocManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
		LocationListener mlocListener = new MyLocationListener();
		mlocManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0,
				mlocListener);

		final Button buttonStat = (Button) findViewById(R.id.btnStatus);
		buttonStat.setOnClickListener(new View.OnClickListener()
		{
			public void onClick(View v)
			{
				if(statId == 0)
				{
					statId = 1;
					buttonStat.setBackgroundDrawable(getResources().getDrawable(R.drawable.custom_button_stop));
					buttonStat.setText("Obecny status: kurs,\ndotknij na postoju, aby zmieniæ.");
				}
				else
				{
					statId = 0;
					buttonStat.setBackgroundDrawable(getResources().getDrawable(R.drawable.custom_button));
					buttonStat.setText("Obecny status: postój,\ndotknij, aby zmieniæ.");
				}
				
				ChangeStatus(statId);
			}
		});
	}

	private class MyLocationListener implements LocationListener
	{
		private String	Text	= "";

		public void onLocationChanged(Location loc)
		{
			// Pobieranie danych z GPS'a
			long currTime = loc.getTime();
			double lat = loc.getLatitude();
			double lon = loc.getLongitude();

			// Odczyt po³o¿enia i przesy³anie co 5000 ms = 5s
			// UWAGA: Czasm zachowuje siê jakby odpalone byly dwa watki,
			// obejscie przez minCounter = -1
			// i pierwszy jalowy odczyt
			if (currTime - prevTime >= 5000)
			{
				Text = "My current location is: " + "Latitude = " + lat
						+ "\nLongitude = " + lon + "\nTime = " + currTime;
				prevTime = loc.getTime();
				//minCounter++;

//				BigDecimal BDlon = new BigDecimal(lon);
//				BigDecimal BDlat = new BigDecimal(lat);
				
				SendCoordinates(lon, lat);

				// Wyswietalnie danych z GPS'a
				TextView tv = (TextView) findViewById(R.id.tvGPSInfo);
				tv.setText(Text);
				tv.refreshDrawableState();
			}
		}

		public void onProviderDisabled(String provider)
		{
			// TODO Auto-generated method stub
			Toast.makeText(getApplicationContext(), "Gps Disabled",
					Toast.LENGTH_SHORT).show();
		}

		public void onProviderEnabled(String provider)
		{
			// TODO Auto-generated method stub
			Toast.makeText(getApplicationContext(), "Gps Enabled",
					Toast.LENGTH_SHORT).show();
		}

		public void onStatusChanged(String provider, int status, Bundle extras)
		{
			// TODO Auto-generated method stub

		}
	}

	public void ChangeStatus(int statusId)
	{
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME1);

		PropertyInfo status = new PropertyInfo();
		status.setName("status");
		status.setValue(statusId);
		request.addProperty(status);

		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
				SoapEnvelope.VER11);
		envelope.dotNet = true;
		envelope.setOutputSoapObject(request);
		HttpTransportSE androidHttpTransport = new HttpTransportSE(URL);
		androidHttpTransport.debug = false;

		try
		{
			androidHttpTransport.call(NAMESPACE + METHOD_NAME1, envelope);
			final Object response = envelope.getResponse();
			//boolean success = (boolean) res;
			
			Boolean result = null;
	        if (response != null)
	        {
	            try
	            {
	                if (response != null
	                        && response.getClass() == 
	                            org.ksoap2.serialization.SoapPrimitive.class)
	                {
	                    result = Boolean.parseBoolean(response.toString());
	                }
	            } catch (Exception e)
	            {
	                // TODO: handle exception
	                e.printStackTrace();
	            }
	        }
			String info = "";

			if (result)
				info = "Status zmieniono na: " + statusId;
			else
				info = "Nie zmieniono statusu!";
			Toast.makeText(getApplicationContext(), info, Toast.LENGTH_SHORT)
					.show();
		}
		catch (Exception e)
		{
			Toast.makeText(getApplicationContext(), "ERROR 1!",
					Toast.LENGTH_SHORT).show();
		}

	}
	
	public void SendCoordinates(Double lon, Double lat)
	{
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME2);

		PropertyInfo lonPoperty = new PropertyInfo();
		lonPoperty.setName("longitude");
		lonPoperty.setValue(lon);
		request.addProperty(lonPoperty);
		
		PropertyInfo latProperty = new PropertyInfo();
		latProperty.setName("latitude");
		latProperty.setValue(lat);
		request.addProperty(latProperty);

		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
				SoapEnvelope.VER11);
		//envelope.addMapping(NAMESPACE, "longitude", )
		MarshalFloat mf = new MarshalFloat();
		mf.register(envelope);
		envelope.dotNet = true;
		envelope.setOutputSoapObject(request);
		HttpTransportSE androidHttpTransport = new HttpTransportSE(URL);
		androidHttpTransport.debug = false;

		try
		{
			androidHttpTransport.call(NAMESPACE + METHOD_NAME2, envelope);
			final Object response = envelope.getResponse();
			//boolean success = (boolean) res;
			
			Boolean result = null;
	        if (response != null)
	        {
	            try
	            {
	                if (response != null
	                        && response.getClass() == 
	                            org.ksoap2.serialization.SoapPrimitive.class)
	                {
	                    result = Boolean.parseBoolean(response.toString());
	                }
	            } catch (Exception e)
	            {
	                // TODO: handle exception
	                e.printStackTrace();
	            }
	        }
			String info = "";

			if (result)
				info = "Wys³ano nowe po³o¿enie";
			else
				info = "Nie mo¿na wys³aæ po³o¿enia!";
			Toast.makeText(getApplicationContext(), info, Toast.LENGTH_SHORT)
					.show();
		}
		catch (Exception e)
		{
			Toast.makeText(getApplicationContext(), "ERROR 1!",
					Toast.LENGTH_SHORT).show();
		}

	}

}