from fap_back import *

inited = False

what_to_keep = {
	'altitude': double_p_value,
	'latitude': double_p_value,
	'longitude': double_p_value,
	'src_callsign': None,
	'dst_callsign': None,
	'timestamp': lambda x: int(long_time(x)),
	'body': None,
	'header': None,
	'type': None,
	'path': None,
	'path_len': None,
}
class Packet(object):
	def __init__(self,packet):
		init()
		fp = None
		self.should_release = False
		if isinstance(packet, fap_packet_t):
			fp = packet
		if isinstance(packet, str):
			self.should_release = True
			fp = fap_parseaprs(packet, len(packet), 0)
		
		for name, func  in what_to_keep.items():
			val = getattr(fp, name)
			if func is not None:
				val = func(val)
			setattr(self, name, val)
		
		fap_free(fp)


			
def init():
	global inited
	if not inited:
		fap_init()
		inited = True

def cleanup():
	global inited
	if inited:
		fap_cleanup()
		inited = False

if __name__ == "__main__":	
	init()
	p = Packet(r'KF7DEI-3>APT312,WIDE2-2:/132932h4012.17N/11019.28WO075/016/A=023420')
	print p.src_callsign
	cleanup()