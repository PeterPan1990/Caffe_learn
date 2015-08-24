# convert form pkl data file from pylearn2 to caffe data leveldb

import caffe_pb2 as proto
import leveldb
import sys

db = leveldb.LevelDB('./cifar_test',block_size=40 * (2 << 20) )

import struct

def unpickle(file):
    import cPickle
    fo = open(file,'rb')
    dict = cPickle.load(fo)
    fo.close()
    return dict

obj = unpickle('./test.pkl')

batch = leveldb.WriteBatch()
print 'Start Reading...'
length = len(obj.get_data())

for i, label_data in enumerate(zip(obj.get_data()[1],obj.get_data()[0])):
    datum = proto.Datum()
    datum.channels = 3
    datum.height = 32
    datum.width = 32
    datum.label = int(label_data[0][0])
    
    for data in label_data[1]:
        datum.float_data.append(data);
    
    key = '%05d' % i
    out = datum.SerializeToString()
        
    batch.Put(key,out)
    
print 'End Reading...'
print 'Strat Writing DB...'
db.Write(batch,sync=True)
print 'End Writing DB...'
print 'Done'

db = None
